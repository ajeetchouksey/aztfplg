module "containerapp" {
    source  ="git::https://github.com/Azure/terraform-azurerm-avm-res-app-containerapp.git?ref=b60df1f9ab1006e099b128ce5bd77ab682a4b074"
    for_each = { for idx, app in var.container_apps : idx => app }
    name = each.value.name
    resource_group_name = module.azurerm_resource_group[0].name
    container_app_environment_resource_id = module.containerapp_environment.resource_id
    revision = each.value.revision
    enable_telemetry = each.value.enable_telemetry
    registries = each.value.registries
    template = each.value.template

}