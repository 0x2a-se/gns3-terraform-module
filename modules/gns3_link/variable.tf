variable "project_id" {
  description = "The ID of the GNS3 project."
  type        = string
}

# variable "link_style" {
#   description = "The style of the link."
#   type        = object({
#     color = optional(string, "")
#     type  = optional(number, 0)
#     width = optional(number, 1)
#   })
#   default = {}
# }

variable "node_a" {
  description = "The name of the first node."
  type        = object({
    id                = string
    adapter_number    = number
    port_number       = number
    label             = optional(object({
      style = optional(string, "")
      text = optional(string, "")
    }), {})
  })
}

variable "node_b" {
  description = "The name of the second node."
  type        = object({
    id                = string
    adapter_number    = number
    port_number       = number
    label             = optional(object({
      style = optional(string, "")
      text = optional(string, "")
    }), {})
  })
}

variable "filters" {
  description = "The filters for the link."
  type        = map(any)
  default = {}
}

variable "suspend" {
  description = "Whether to suspend the link."
  type        = bool
  default     = false
}