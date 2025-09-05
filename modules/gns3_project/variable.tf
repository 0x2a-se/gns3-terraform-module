variable "name" {
  description = "Name of the project"
  type        = string
}

variable "scene_height" {
  description = "Height of the scene"
  type        = number
  default = null
}
variable "scene_width" {
  description = "Width of the scene"
  type        = number
  default = null
}
variable "show_grid" {
  description = "Show grid"
  type        = bool
  default = null
}
variable "auto_close" {
  description = "Auto close"
  type        = bool
  default = null
}
variable "auto_open" {
  description = "Auto open"
  type        = bool
  default = null
}
variable "snap_to_grid" {
  description = "Snap to grid"
  type        = bool
  default = null
}
variable "zoom" {
  description = "Zoom"
  type        = number
  default = null
}
variable "project_id" {
  description = "Project ID"
  type        = string
  default = null
}

variable "auto_start" {
  description = "Auto start"
  type        = bool
  default = null
}


variable "grid_size" {
  description = "Grid size"
  type        = number
  default = null
}

variable "drawing_grid_size" {
  description = "Drawing grid size"
  type        = number
  default = null
}

variable "show_interface_labels" {
  description = "Show interface labels"
  type        = bool
  default = null
}

variable "show_layers" {
  description = "Show layers"
  type        = bool
  default = null
}

variable "variables" {
  description = "List of variables"
  type        = list(any)
  default     = []
}