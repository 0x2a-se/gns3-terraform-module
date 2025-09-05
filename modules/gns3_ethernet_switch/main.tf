
resource "restapi_object" "gns3_ethernet_switch" {
  path                      = "/projects/${var.project_id}/nodes"
  ignore_all_server_changes = true
  id_attribute              = "node_id"
  data = jsonencode({
    name       = var.node_name
    compute_id = "local"
    node_type  = "ethernet_switch"
    symbol     = ":/symbols/ethernet_switch.svg"
    x          = var.x
    y          = var.y
    properties = {
      ports_mapping = [for port in range(var.number_of_ports + 1) :
        {
          name        = "Ethernet${port}"
          port_number = port
          type        = "access"
          vlan        = 1
        }
      ]
    }
  })

}