output "project" {
  description = "The name of the GNS3 project."
  value       = module.project
}

output "nodes" {
  value       = { for key, node in module.nodes : key => node.node }
}

output "links" {
  value       = { for key, link in module.links : key => link.link }
}