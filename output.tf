output "project" {
  description = "The name of the GNS3 project."
  value       = module.project
}

output "nodes" {
  value       = { for key, node in module.nodes : key => node.node }
}

output "links" {
  value       = module.links
}