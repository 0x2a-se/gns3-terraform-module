locals {
    project_data = {
        name        = var.name
        scene_height = var.scene_height
        scene_width  = var.scene_width
        show_grid    = var.show_grid
        auto_close   = var.auto_close
        auto_open    = var.auto_open
        snap_to_grid = var.snap_to_grid
        zoom         = var.zoom
    }
    post_data = { for k, v in local.project_data : k => v if v != null }
}

resource "restapi_object" "project" {
  #provider = restapi.restapi_headers
  path                      = "/projects"
  ignore_all_server_changes = true
  #data = "{ \"name\": \"tf-api-vxlan-multisite\", \"show_grid\": false  }"
  data = jsonencode(local.post_data)
  id_attribute = "project_id"
}