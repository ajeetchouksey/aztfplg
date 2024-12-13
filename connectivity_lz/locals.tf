locals {
  environment = var.environment
  landingzone_prefix = "c"
  resource_name_prefix = "tf"
  location_short             = "we"

  tags = {
    environment = var.environment
    landingzone= "connectivity"
    project = "TF Playground" 
    last_updated = formatdate("YYYY-MM-DD", timestamp())
  }


 

}