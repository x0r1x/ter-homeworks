###cloud vars
variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

###common vars
variable "vms" {
  type = map(object({
    env_name  = string
    instance_name = string
    instance_count = number
    image_family = string
    public_ip = bool
    serial-port-enable = number
  }))
  default = {
    "marketing" = {
      env_name = "marketing"
      instance_name = "web"
      instance_count = 1
      image_family = "ubuntu-2004-lts"
      public_ip = false
      serial-port-enable = 1
    },
    "analytic" = {
      env_name = "analytic"
      instance_name = "web"
      instance_count = 1
      image_family = "ubuntu-2004-lts"
      public_ip = false
      serial-port-enable = 1
    }
  }
}

variable "s3_dev_mod" {
  type = object({
    bucket_name = string
    max_size = number
  })
  default = {
    bucket_name = "bender-dev-bucket"
    max_size = 1024 * 1024 * 1024 # 1GB 
  }
}
