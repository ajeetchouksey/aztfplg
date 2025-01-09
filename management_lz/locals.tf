locals {
  environment = var.environment
  landingzone_prefix = "m"
  resource_name_prefix = "tf"
  location_short             = "we"

  tags = {
    environment = var.environment
    landingzone= "management"
    project = "TF Playground" 
    last_updated = formatdate("YYYY-MM-DD", timestamp())
  }


 

}