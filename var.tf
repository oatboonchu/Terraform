variable "add_ID" {
  type = string
  default = "7403ddcf-7648-4571-a356-3b05e18fe1cd"
}
variable "password" {
  type = string
  default = "8Wd8Q~f-yY_RyUMKb0.lLiVUKLfm0j64iWfuFbaS"
}
variable "tenant" {
  type = string
  default = "bb706be4-51a3-4736-becb-098c267ecc32"
}
variable "subscription" {
  type = string
  default = "402d0ac7-0359-419d-8710-46a852c518bc"
}

variable "sa_key" {
  type = string
  default = "terraform.tfstate"
}
variable "sa_access_key" {
  type = string
  default = "cy/sazkQKcunlATK4xN9n7YYfMc/Uh7gnJpj65nU/woq9OxtWEXYjmSOZD3G+2KZ6tjJesfyqF7S+AStFNww4w=="
}
variable "location_we" {
  type        = string
  default     = "West Europe"
}
variable prefix {
  type        = string
  default     = "dev"
  description = "description"
}



######### Dev Variable ##########
variable "rg_name_dev" {
  type = string
  default = "dev-resource"
}
variable "sa_terraform" {
  type = string
  default = "terraformdbs"
}
variable "sa_con_dev" {
  type = string
  default = "dev-storage-container"
}


######### mirror Variable ##########
variable "rg_name_mirror" {
  type = string
  default = "mirror-resource"
}

variable resource_group_all {
  type        = string
  default     = "/home/oat/az-cloud/resource_groups.txt"
  description = "current dir"
}


