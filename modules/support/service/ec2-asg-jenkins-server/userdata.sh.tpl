#!/bin/bash -xe
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1

#Install prerequisites - All now pre-installed on Custom AMI
#sudo yum update -y
#sudo yum install -y httpd.x86_64
#sudo service httpd start
#sudo service httpd enable
#sudo yum install -y zip
#sudo yum install -y unzip
#sudo yum install git
#sudo yum install -y docker
#sudo service docker start
#sudo service docker enable
#groupadd docker
#usermod -aG docker jenkins
#chmod 666 /var/run/docker.sock

#sudo yum install nodejs
#sudo yum install -y python3

#cd /usr/lib/jvm
#sudo rm -rf *1.7.0*
#sudo yum install java-1.8.0-openjdk-devel -y
#
#sudo yum install awscli -y

INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)

VOLUME_ID=$(aws ec2 --region "${REGION}" describe-volumes --filters Name=tag-key,Values="Name" Name=tag-value,Values="${SERVICE_NAME}" Name=tag-key,Values="Application" Name=tag-value,Values="${APPLICATION}" --query 'Volumes[*].{ID:VolumeId}' --output text)

VOLUME_STATUS=$(aws ec2 describe-volumes --region "${REGION}" --volume-ids $VOLUME_ID --query 'Volumes[0].State')


if [ $VOLUME_STATUS == '"available"' ]; then

aws ec2 attach-volume --region "${REGION}" --volume-id $VOLUME_ID --instance-id $INSTANCE_ID --device /dev/xvdh

MOUNT_STATE="unknown"
until [ $MOUNT_STATE != "attached" ]; do
  MOUNT_STATE=$(aws ec2 describe-volumes \
    --region "${REGION}" \
    --filters \
        Name=attachment.instance-id,Values=$INSTANCE_ID \
        Name=attachment.device,Values=/dev/xvdh \
    --query Volumes[].Attachments[].State \
    --output text)
  sleep 5
done

# Format /dev/nvme1n1 if it does not contain a partition yet
if [ "$(file -b -s /dev/nvme1n1 )" == 'data' ]; then
mkfs -t ext4 /dev/nvme1n1
sfdisk -R /dev/nvme1n1
fi

mkdir -p /var/lib/jenkins
mount /dev/nvme1n1 /var/lib/jenkins
# Persist the volume in /etc/fstab so it gets mounted again
echo '/dev/nvme1n1 /var/lib/jenkins ext4 defaults,nofail 0 2' >> /etc/fstab

# Install Jenkins
curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | sudo tee /etc/yum.repos.d/jenkins.repo
sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
sudo yum install -y jenkins

echo "export JAVA_HOME=/usr/lib/jvm/jre-1.8.0/bin" >> /home/ec2-user/.bash_profile
echo "export PATH=$PATH:$JAVA_HOME" >> /home/ec2-user/.bash_profile

#sudo wget https://releases.hashicorp.com/terraform/0.12.2/terraform_0.12.2_linux_amd64.zip
#sudo unzip terraform_0.12.2_linux_amd64.zip –d /usr/bin

sudo service jenkins restart

fi
