# gns3-terraform-module
Terraform module to handle GNS3 projects

## Example

```Terraform
terraform {
  required_providers {
    restapi = {
      source = "Mastercard/restapi"
      version = "2.0.1"
    }
  }
  
}


module "project" {
  source = "github.com:0x2a-se/gns3-terraform-module.git"
  url = "http://<ip address>:3080"
  project = {
    name = "module-test"
  }
  username ="<username>"
  password = "<password>"
  template_nodes = [
    {
      name               = "dc1-leaf111"
      template_name = "<sw qemu template name>"
      x                  = 0
      y                  = 0
      properties = {
        adapters = 25
      }
      started = true
      os = "nxos"

    },
    {
      name               = "dc1-spine101"
      template_name = "<sw qemu template name>"
      x                  = 0
      y                  = 100
      properties = {
        adapters = 25
      }
      #started = false
      os = "nxos"
    },
    {
      name               = "oob1"
      template_name = "Ethernet switch"
      x                  = 100
      y                  = 100
    },
    {
      name               = "cloud"
      template_name = "Cloud"
      x                  = 200
      y                  = 100
    }
  ]
  node_links = [
    {
      node_a_name        = "dc1-leaf111"
      node_b_name        = "dc1-spine101"
      node_a_interface = "Ethernet1/1"
      node_b_interface = "Ethernet1/1"
      link_style = {
        color = "#FF0000"
        type  = 0
        width = 2
      }
    },
    {
      node_a_name        = "oob1"
      node_b_name        = "cloud"
      node_a_interface = "Ethernet1"
      node_b_interface = "vlan173"

    }
  ]
}
```
