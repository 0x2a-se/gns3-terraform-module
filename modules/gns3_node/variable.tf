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
  type        = object({
      adapter_type                       = optional(string)       # e.g. "e1000"
      adapters                           = optional(number)
      bios_image                         = optional(string)
      bios_image_md5sum                  = optional(string)
      boot_priority                      = optional(string)       # enum: c, d, n, cn, cd, dn, dc, nc, nd
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
      on_close                           = optional(string)       # enum: power_off, shutdown_signal, save_vm_state
      options                            = optional(string)
      platform                           = optional(string)       # enum with many options
      process_priority                   = optional(string)       # enum: realtime, very high, high, normal, etc.
      qemu_path                          = optional(string)
      ram                                = optional(number)
      replicate_network_connection_state = optional(bool)
      tpm                                = optional(bool)
      uefi                               = optional(bool)
      usage                              = optional(string)
    })
  default     = {}
  
}
