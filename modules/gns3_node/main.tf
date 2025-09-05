data "restapi_object" "node_template" {

  path         = "/templates"
  search_key   = "name"
  search_value = var.template_name
  id_attribute = "template_id"
}

resource "restapi_object" "gns3_node_from_template" {
  path                      = "/projects/${var.project_id}/nodes"
  create_path               = "/projects/${var.project_id}/templates/${data.restapi_object.node_template.id}"
  update_path               = ""
  destroy_path              = ""
  ignore_all_server_changes = true
  id_attribute              = "node_id"
  data = jsonencode({
    name       = var.name
    y          = var.y
    x          = var.x
    compute_id = "local"
  })

}

resource "restapi_object" "gns3_node" {
  #count = length(var.node_data) > 0 ? 1 : 0
  path                      = "/projects/${var.project_id}/nodes"
  create_path               = "/projects/${var.project_id}/nodes/{id}"
  object_id                 = restapi_object.gns3_node_from_template.id
  create_method             = "PUT"
  update_method             = "PUT"
  ignore_all_server_changes = true
  id_attribute              = "node_id"
  data = jsonencode({
    name       = var.name
    y          = var.y
    x          = var.x
    properties = var.properties
    # command_line = var.node_command_line
    # console_type = var.node_console_type
    # custom_adapters = var.node_custom_adapters
    # first_port_name = var.node_first_port_name
    # label = var.node_label
  })

}

resource "restapi_object" "start_node" {
  count        = var.started ? 1 : 0
  read_path    = "/projects/${var.project_id}/nodes/{id}"
  path         = "/projects/${var.project_id}/nodes/{id}/start"
  destroy_path = "/projects/${var.project_id}/nodes/{id}/stop"
  #create_path  = "/projects/${var.project_id}/nodes/${restapi_object.gns3_node.id}/start"
  #destroy_path = "/projects/${var.project_id}/nodes/${restapi_object.gns3_node.id}/stop"
  update_path               = "/projects/${var.project_id}/nodes/{id}/reload"
  destroy_method            = "POST"
  update_method             = "POST"
  ignore_all_server_changes = true
  #id_attribute              = "node_id"
  object_id = restapi_object.gns3_node.id
  data      = "{}"

  # lifecycle {
  #   ignore_changes = [
  #     update_path
  #   ]
  #   replace_triggered_by = [
  #     restapi_object.gns3_node,
  #     #restapi_object.update_node
  #   ]
  # }
}

