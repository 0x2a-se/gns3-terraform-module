variable "url" {
  type        = string
  description = "value of gns3 server url, example http://<IP address>:3080"
}



variable "username" {
  type        = string
  description = "GNS3 server username"
  default     = ""
}

variable "password" {
  type        = string
  description = "GNS3 server password"
  default     = ""
}

variable "project" {
  type = object({
    name                  = string
    scene_height          = optional(number, null)
    scene_width           = optional(number, null)
    show_grid             = optional(bool, null)
    auto_close            = optional(bool, false)
    auto_open             = optional(bool, true)
    auto_start            = optional(bool, true)
    snap_to_grid          = optional(bool, null)
    zoom                  = optional(number, null)
    grid_size             = optional(number, null)
    drawing_grid_size     = optional(number, null)
    show_interface_labels = optional(bool, false)
    show_layers           = optional(bool, false)
    variables             = optional(list(any))
  })
}
variable "template_nodes" {
  type = list(object({
    name          = string
    template_name = string
    x             = optional(number, 0)
    y             = optional(number, 0)
    properties = optional(object({
      adapter_type                       = optional(string) # e.g. "e1000"
      adapters                           = optional(number)
      bios_image                         = optional(string)
      bios_image_md5sum                  = optional(string)
      boot_priority                      = optional(string) # enum: c, d, n, cn, cd, dn, dc, nc, nd
      cdrom_image                        = optional(string)
      cdrom_image_md5sum                 = optional(string)
      cpu_throttling                     = optional(number)
      cpus                               = optional(number)
      create_config_disk                 = optional(bool)
      hda_disk_image                     = optional(string)
      hda_disk_image_md5sum              = optional(string)
      hda_disk_interface                 = optional(string)
      hdb_disk_image                     = optional(string)
      hdb_disk_image_md5sum              = optional(string)
      hdb_disk_interface                 = optional(string)
      hdc_disk_image                     = optional(string)
      hdc_disk_image_md5sum              = optional(string)
      hdc_disk_interface                 = optional(string)
      hdd_disk_image                     = optional(string)
      hdd_disk_image_md5sum              = optional(string)
      hdd_disk_interface                 = optional(string)
      initrd                             = optional(string)
      initrd_md5sum                      = optional(string)
      kernel_command_line                = optional(string)
      kernel_image                       = optional(string)
      kernel_image_md5sum                = optional(string)
      legacy_networking                  = optional(bool)
      linked_clone                       = optional(bool)
      mac_address                        = optional(string)
      on_close                           = optional(string) # enum: power_off, shutdown_signal, save_vm_state
      options                            = optional(string)
      platform                           = optional(string) # enum with many options
      process_priority                   = optional(string) # enum: realtime, very high, high, normal, etc.
      qemu_path                          = optional(string)
      ram                                = optional(number)
      replicate_network_connection_state = optional(bool)
      tpm                                = optional(bool)
      uefi                               = optional(bool)
      usage                              = optional(string)
    }), {})
    started = optional(bool, true)
    role    = optional(string, "")
  }))
  default = []
}

variable "node_links" {
  type = list(object({
    node_a_name      = string
    node_b_name      = string
    node_a_interface = string
    node_b_interface = string
    link_style = optional(object({
      color = optional(string, "#000000")
      type  = optional(number, 1)
      width = optional(number, 2)
    }), {})
  }))
  default = []
}
