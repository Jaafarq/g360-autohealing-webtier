output "lb_public_ip" {
  description = "Public IP of the load balancer"
  value       = azurerm_public_ip.lb_pip.ip_address
}
