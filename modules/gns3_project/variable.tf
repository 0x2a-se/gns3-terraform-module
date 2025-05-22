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