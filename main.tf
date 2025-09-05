module "project" {
  source       = "./modules/gns3_project"
  name         = var.project.name
  scene_height = var.project.scene_height
  scene_width  = var.project.scene_width
  show_grid    = var.project.show_grid
  auto_close   = var.project.auto_close
  auto_open    = var.project.auto_open
  snap_to_grid = var.project.snap_to_grid
  zoom         = var.project.zoom
}

module "nodes" {
  source = "./modules/gns3_node"
  for_each = {
    for node in var.template_nodes :
    node.name => node
  }
  project_id    = module.project.id
  template_name = each.value.template_name
  name          = each.value.name
  y             = each.value.y
  x             = each.value.x
  properties    = each.value.properties
  started       = each.value.started
}



locals {
  node_ports_map = merge([
    for node_key, node in module.nodes : {
      for port in jsondecode(node.node.api_response).ports : "${node_key}-${port.name}" => port
    }
  ]...) #jsondecode(module.nodes["dc1-leaf111"].node.api_response).ports
}

resource "null_resource" "link_dependencies" {
  for_each = {
    for link in var.node_links :
    "${link.node_a_name}-${link.node_a_interface}-${link.node_b_name}-${link.node_b_interface}" => link
  }
  triggers = { id = each.key }
}

module "links" {
  source = "./modules/gns3_link"
  for_each = {
    for link in var.node_links :
    "${link.node_a_name}-${link.node_a_interface}-${link.node_b_name}-${link.node_b_interface}" => link
  }
  project_id = module.project.id
  node_a = {
    id             = module.nodes[each.value.node_a_name].id
    adapter_number = local.node_ports_map["${each.value.node_a_name}-${each.value.node_a_interface}"].adapter_number
    port_number    = local.node_ports_map["${each.value.node_a_name}-${each.value.node_a_interface}"].port_number
    label = {
      text  = local.node_ports_map["${each.value.node_a_name}-${each.value.node_a_interface}"].short_name
      style = "font-family: TypeWriter;font-size: 10.0;font-weight: bold;fill: #000000;fill-opacity: 1.0;"
    }
    link_style = each.value.link_style
  }
  node_b = {
    id             = module.nodes[each.value.node_b_name].id
    adapter_number = local.node_ports_map["${each.value.node_b_name}-${each.value.node_b_interface}"].adapter_number
    port_number    = local.node_ports_map["${each.value.node_b_name}-${each.value.node_b_interface}"].port_number
    label = {
      text = local.node_ports_map["${each.value.node_b_name}-${each.value.node_b_interface}"].short_name
      #style = "font-family: TypeWriter;font-size: 10.0;font-weight: bold;fill: #000000;fill-opacity: 1.0;"
    }

  }
  link_style = each.value.link_style
  depends_on = [
    null_resource.link_dependencies
  ]

}
