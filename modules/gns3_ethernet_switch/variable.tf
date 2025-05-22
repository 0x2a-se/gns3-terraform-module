variable "project_id" {
  description = "The ID of the GNS3 project."
  type        = string
}

variable "node_name" {
  description = "The name of the GNS3 node."
  type        = string
}

variable "y" {
  description = "The y-coordinate of the GNS3 node."
  type        = number
}
variable "x" {
  description = "The x-coordinate of the GNS3 node."
  type        = number
}

variable "number_of_ports" {
  description = "The number of configured ports."
  type        = number
}
