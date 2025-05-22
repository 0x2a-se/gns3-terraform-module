variable "url" {
  type = string
  description = "value of gns3 server url, example http://<IP address>:3080"
}



variable "username" {
  type = string
  description = "GNS3 server username"
  default = ""
}

variable "password" {
  type = string
  description = "GNS3 server password"
  default = ""
}

variable "project" {
  type = object({
    name        = string
    scene_height = optional(number, null)
    scene_width  = optional(number, null)
    show_grid    = optional(bool, null)
    auto_close   = optional(bool, null)
    auto_open    = optional(bool, true)
    snap_to_grid = optional(bool, null)
    zoom         = optional(number, null)
  })
}
variable "template_nodes" {
  type = list(object({
    name = string
    template_name = string
    x = number
    y = number
    properties = optional(map(any), {})
    started = optional(bool, true)
    role = optional(string, "")
  }))
  default = []
}

variable "node_links" {
  type = list(object({
    node_a_name        = string
    node_b_name        = string
    node_a_interface = string
    node_b_interface = string
    link_style = optional(map(any), null)
  }))
  default = []
}
