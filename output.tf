output "project" {
  description = "The name of the GNS3 project."
  value       = module.project
}

output "nodes" {
  value       = module.nodes
}

output "links" {
  value       = module.links
}