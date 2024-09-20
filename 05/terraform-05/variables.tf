###cloud vars
/*variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}*/

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
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

###common vars

/*variable "vms_ssh_root_key" {
  type        = string
  default     = "your_ssh_ed25519_key"
  description = "ssh-keygen -t ed25519"
}*/

###example vm_web var
variable "vm_web_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "example vm_web_ prefix"
}

###example vm_db var
variable "vm_db_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "example vm_db_ prefix"
}

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
      public_ip = true
      serial-port-enable = 1
    },
    "analytic" = {
      env_name = "analytic"
      instance_name = "web"
      instance_count = 1
      image_family = "ubuntu-2004-lts"
      public_ip = true
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

variable "not_valid_ip" {
  type=string
  description="ip-адрес"
  default = "1920.1680.0.1"
  validation {
    condition = can(regex("^((25[0-5]|(2[0-4]|1\\d|[1-9]|)\\d)\\.?\\b){4}$", var.not_valid_ip))
    error_message = "Error, IP address is incorrect "
  }
}

variable "valid_ip" {
  type=string
  description="ip-адрес"
  default = "192.168.0.1"
  validation {
    condition = can(regex("^((25[0-5]|(2[0-4]|1\\d|[1-9]|)\\d)\\.?\\b){4}$", var.valid_ip))
    error_message = "Error, IP address is incorrect"
  }
}

variable "list_valid_ip" {
  type=list(string)
  description="список ip-адресов"
  default = ["192.168.0.1", "1.1.1.1", "127.0.0.1"]
  validation {
    condition = alltrue([for i in var.list_valid_ip: can(regex("^((25[0-5]|(2[0-4]|1\\d|[1-9]|)\\d)\\.?\\b){4}$", i))])
    error_message = "Error, var of list IP address is incorrect"
  }
}

variable "list_not_valid_ip" {
  type=list(string)
  description="список ip-адресов"
  default = ["192.168.0.1", "1.1.1.1", "1270.0.0.1"]
  validation {
    condition = alltrue([for i in var.list_not_valid_ip: can(regex("^((25[0-5]|(2[0-4]|1\\d|[1-9]|)\\d)\\.?\\b){4}$", i))])
    error_message = "Error, var of list IP address is incorrect"
  }
}

variable "upper_letter" {
  type=string
  description="upper letter"
  default = "one more Time"
  validation {
    condition = !can(regex("[A-Z]+", var.upper_letter))
    error_message = "Error, the string contains uppercase characters"
  }
}

variable "in_the_end_there_can_be_only_one" {
    description="Who is better Connor or Duncan?"
    type = object({
        Dunkan = optional(bool)
        Connor = optional(bool)
    })

    default = {
        Dunkan = true
        Connor = false
    }

    validation {
        error_message = "There can be only one MacLeod"
        condition = var.in_the_end_there_can_be_only_one.Dunkan != var.in_the_end_there_can_be_only_one.Connor
    }
}