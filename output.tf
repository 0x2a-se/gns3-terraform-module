output "project" {
  description = "The name of the GNS3 project."
  value       = module.project.data
}

output "nodes" {
  value       = { for key, node in module.nodes : key => node.node }
}

output "links" {
  value       = { for key, link in module.links : key => link.link }
}
output "var_project" {
  value = var.project
}

output "var_template_nodes" {
  value = var.template_nodes
}
output "var_node_links" {
  value = var.node_links
}