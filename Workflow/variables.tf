variable "notification_channel" {
  type = map(object({
    name = string
    type = string
    product = string
    key-1= string
    value= string



  }))
  
}
variable "notification_destination" {
  type = map(object({
    name = string
    type = string
    key-2 = string
    value = string

  }))
  
}
variable "newrelicWorkflow" {
  type = map(object({
    name = string
    muting_rules_handling = string
    nameI = string
    typeI = string
    attribute = string
    operator = string
    filter_values=any
    



  }))


  
}


variable "account_id" {
  type = number
}
variable "api_key" {
  type = string
}

