output "name" {
  value = azurerm_windows_function_app.function_app.name
}

output "default_hostname" {
  value = azurerm_windows_function_app.function_app.default_hostname
}
