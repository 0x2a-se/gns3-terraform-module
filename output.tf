output "project" {
  description = "The name of the GNS3 project."
  value       = module.project
}

output "nodes" {
  value       = { for node in module.nodes : node.name => node.node }
}

output "links" {
  value       = module.links
}