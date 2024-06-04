resource "azurerm_virtual_network" "main" {
  name                = "${var.prefix}-network"
  address_space       = ["10.84.0.0/16"]
  location            = var.location_we
  resource_group_name = var.rg_name_dev
}

resource "azurerm_subnet" "internal" {
  name = "internal"
  resource_group_name  = "${azurerm_virtual_network.main.resource_group_name}"
  virtual_network_name = "${azurerm_virtual_network.main.name}"
  address_prefixes = ["10.84.46.0/24"]
}

resource "azurerm_network_interface" "main" {
  name                = "${var.prefix}-nic"
  location            = var.location_we
  resource_group_name  = "${azurerm_virtual_network.main.resource_group_name}"

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = "${azurerm_subnet.internal.id}"
    private_ip_address_allocation = "Dynamic"
  }
}