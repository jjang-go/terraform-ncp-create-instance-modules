data "ncloud_zones" "zones" {
  region = var.region
}

data "ncloud_server_images" "server_image" {}

data "ncloud_server_products" "product" {
  server_image_product_code = local.server_image[0].id

  filter {
    name   = "product_code"
    values = [var.storage_type]
    regex  = true
  }

  filter {
    name   = "cpu_count"
    values = [var.server_cpus]
  }

  filter {
    name   = "memory_size"
    values = ["${var.server_memory_in_gbs}GB"]
  }

  filter {
    name   = "generation_code"
    values = [upper(var.server_generation)]
  }
}

data "ncloud_subnet" "get_subnet" {
  id = var.subnet_no
}