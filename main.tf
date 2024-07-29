module "alert_policy" {
  source      = "./Alerts"
  alert_conditions = var.alert_conditions
 
}