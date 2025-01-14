locals {
  additional_tags = null_resource.tags_as_list_of_maps.*.triggers
}

resource "null_resource" "tags_as_list_of_maps" {
  count = length(var.tags_as_map)
  triggers = map(
    "key", element(keys(var.tags_as_map), count.index),
    "value", element(values(var.tags_as_map), count.index),
    "propagate_at_launch", true
  )

}