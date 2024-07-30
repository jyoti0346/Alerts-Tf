module "alert_policy" {
  source      = "./Alerts"
  alert_conditions = var.alert_conditions
  account_id = var.newrelic_account_id
  api_key = var.newrelic_api_key
}
  

  module "alert_Workflow"{
    source = "./Workflow"
    account_id = var.newrelic_account_id
    api_key = var.newrelic_api_key
    newrelicWorkflow = var.newrelicWorkflow
    notification_channel = var.notification_channel
    notification_destination = var.notification_destination
 
}
