variable "project_id" {
  description = "The ID of the GNS3 project."
  type        = string
}

variable "template_name" {
  description = "The name of the GNS3 node template."
  type        = string
}

variable "name" {
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

variable "started" {
  type    = bool
  default = true
}

variable "properties" {
  description = "The data for the GNS3 node."
  type        = map(any)
  default     = {}
  
}
