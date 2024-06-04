# Get list of resource group
resource "null_resource" "list_resource_groups" {
  provisioner "local-exec" {
    command = "cd /home/oat/az-cloud && az group list --query '[].name' -o tsv > ${var.resource_group_all}"
  }
}

data "local_file" "resource_groups" {
  filename = var.resource_group_all
}

locals {
  dev_rg_exist = contains(local.resource_group_names, var.rg_name_dev)
  mirror_rg_exist = contains(local.resource_group_names, var.rg_name_mirror)
}


resource "azurerm_resource_group" "dev" {
  count = local.dev_rg_exist == true ? 0 : 1
  name     = var.rg_name_dev
  location = var.location_we

  lifecycle {
    ignore_changes = [
      # Ignore changes to the 'tags' attribute
      tags,
    ]
  }
}



locals {
  resource_group_names = split("\n", trimspace(data.local_file.resource_groups.content))
}

output "resource_group_names" {
  value = local.resource_group_names
}

resource "azurerm_resource_group" "mirror" {
  count = local.dev_rg_exist == true && local.mirror_rg_exist == false ? 1 : 0
  name     = var.rg_name_mirror
  location = var.location_we
}


