resource "restapi_object" "gns3_link" {
  path                      = "/projects/${var.project_id}/links"
  ignore_all_server_changes = true
  id_attribute              = "link_id"
  data = jsonencode({
    nodes = [
      {
        node_id             = var.node_a.id
        adapter_number = var.node_a.adapter_number
        port_number    = var.node_a.port_number
        label = var.node_a.label
      },
      {
        node_id             = var.node_b.id
        adapter_number = var.node_b.adapter_number
        port_number    = var.node_b.port_number
        label = var.node_b.label
      }
    ]
  })
}