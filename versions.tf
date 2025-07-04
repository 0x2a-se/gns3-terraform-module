terraform {
  required_providers {
    restapi = {
      source = "Mastercard/restapi"
      version = "2.0.1"
    }
  }
  
}

# provider "restapi" {
#   uri                  = "${var.url}/v2"
#   write_returns_object = true
#   debug                = true
#   username = var.username
#   password = var.password


#   create_method  = "POST"
#   update_method  = "PUT"
#   destroy_method = "DELETE"
# }
