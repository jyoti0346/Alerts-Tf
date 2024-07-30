resource "newrelic_notification_channel" "NC" {
 
  
   for_each = var.notification_channel
  name = each.value.name
  type = each.value.type
   destination_id = newrelic_notification_destination.ND[each.key].id 
  product = each.value.product

 

  property {
    key = each.value.key-1
    value = each.value.value
  }
}
resource "newrelic_notification_destination" "ND" {
    
  for_each = var.notification_destination

  name = each.value.name
  type = each.value.type

  property {
    key = each.value.key-2
    value = each.value.value
  }
}
resource "newrelic_workflow" "workflowAlerts" {
  for_each = var.newrelicWorkflow
  name = each.value.name
  muting_rules_handling = each.value.muting_rules_handling

  issues_filter {
    name = each.value.nameI
    type = each.value.typeI

    predicate {
      attribute = each.value.attribute
      operator = each.value.operator
      values = each.value.filter_values
    #   values = [ newrelic_alert_policy.ResourcePolicy.id ]
    #   values = [var.policy_id]
    }
  }

  destination {
    channel_id = newrelic_notification_channel.NC[each.key].id
  }
}
 