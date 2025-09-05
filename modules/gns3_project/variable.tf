variable "name" {
  description = "Name of the project"
  type        = string
}

variable "scene_height" {
  description = "Height of the scene"
  type        = optional(number, null)
}

variable "scene_width" {
  description = "Width of the scene"
  type        = optional(number, null)
}

variable "show_grid" {
  description = "Show grid"
  type        = optional(bool, null)
}

variable "auto_close" {
  description = "Auto close"
  type        = optional(bool, false)
}

variable "auto_open" {
  description = "Auto open"
  type        = optional(bool, true)
}

variable "auto_start" {
  description = "Auto start"
  type        = optional(bool, true)
}

variable "snap_to_grid" {
  description = "Snap to grid"
  type        = optional(bool, null)
}

variable "zoom" {
  description = "Zoom"
  type        = optional(number, null)
}

variable "grid_size" {
  description = "Grid size"
  type        = optional(number, null)
}

variable "drawing_grid_size" {
  description = "Drawing grid size"
  type        = optional(number, null)
}

variable "show_interface_labels" {
  description = "Show interface labels"
  type        = optional(bool, false)
}

variable "show_layers" {
  description = "Show layers"
  type        = optional(bool, false)
}

variable "variables" {
  description = "List of variables"
  type        = list(any)
  default     = []
}