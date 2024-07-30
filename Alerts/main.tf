resource "newrelic_alert_policy" "ResourcePolicy" {
 

  name               = "moduleAlerts"
  incident_preference = "PER_CONDITION"
}

resource "newrelic_nrql_alert_condition" "Condition" {
    policy_id                      = newrelic_alert_policy.ResourcePolicy.id 

    for_each = var.alert_conditions
 
  name                           = each.value.name

  enabled                        = each.value.enabled
  violation_time_limit_seconds   = 360
  fill_option                    = each.value.option
  fill_value                     = each.value.Fillvalue
  aggregation_window             = 60
  aggregation_method             = "event_flow"
  aggregation_delay              = 120
  expiration_duration            = 120
  open_violation_on_expiration   = true
  close_violations_on_expiration = true
  slide_by                       = 30

  nrql {
   query = each.value.query
  }

  critical {
    operator              = each.value.operatorC
    threshold             = each.value.thresholdC
    threshold_duration    = each.value.durationC
    threshold_occurrences = "ALL"
  }

  warning {
    operator              = each.value.operatorW
    threshold             = each.value.thresholdW
    threshold_duration    = each.value.durationW
    threshold_occurrences = "ALL"
  }
}
# resource "newrelic_notification_channel" "NC" {
 
  
#    for_each = var.notification_channel
#   name = each.value.name
#   type = each.value.type
#    destination_id = newrelic_notification_destination.ND[each.key].id 
#   product = each.value.product

 

#   property {
#     key = each.value.key-1
#     value = each.value.value
#   }
# }
# resource "newrelic_notification_destination" "ND" {
    
#   for_each = var.notification_destination

#   name = each.value.name
#   type = each.value.type

#   property {
#     key = each.value.key-2
#     value = each.value.value
#   }
# }
# resource "newrelic_workflow" "workflowAlerts" {
#   for_each = var.newrelicWorkflow
#   name = each.value.name
#   muting_rules_handling = each.value.muting_rules_handling

#   issues_filter {
#     name = each.value.nameI
#     type = each.value.typeI

#     predicate {
#       attribute = each.value.attribute
#       operator = each.value.operator
#       values = [ newrelic_alert_policy.ResourcePolicy.id ]
#     }
#   }

#   destination {
#     channel_id = newrelic_notification_channel.NC[each.key].id

#   }
# }
 