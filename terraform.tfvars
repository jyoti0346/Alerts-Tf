
alert_conditions = {
  "orders" = {
     name   = "Orders"

  enabled   = true
 
  option                   =  "static"
   Fillvalue                = 1.0
  query =  "SELECT count(*) AS 'orders' FROM Transaction WHERE appName='foodme-mine'"
  
  thresholdW =  2.0
   operatorC = "above"
  operatorW =  "above"
  
  thresholdC =  3.0
  durationC = 300
  durationW = 300
 
}
"Disk"= {
     name   = "localdiskC"

  enabled   = true
 
  option                   =  "static"
   Fillvalue                = 1.0
  query = " SELECT average(diskUsedPercent) FROM StorageSample WHERE hostname = 'DESKTOP-PNVDQC8' AND device = 'C:'"
  
  thresholdW =  2.0
   operatorC = "above"
  operatorW =  "above"
  
  thresholdC =  3.0
  durationC = 300
  durationW = 300
 
}
}




# typeV = "Email"
# destinationId = "d84dde56-994f-44d8-9717-5f2e8c3c73b0"
 notification_channel = {
  "0" = {
     name = "email"
  type = "EMAIL"
  
  product = "IINT"
    key-1=  "customDetailsEmail"
    value= "Value!"



  }
  
}
notification_destination= {
 "0"= {
    name = "destination"
    type = "EMAIL"
    key-2 = "email"
    value = "jahanvi3005@gmail.com"
  }
  
}
newrelicWorkflow = {
  "0" = {
     name = "workflowAlerts-1"
  muting_rules_handling = "NOTIFY_ALL_ISSUES"
  nameI = "Filter-name"
    typeI = "FILTER"
    attribute = "labels.policyIds"
      operator = "EXACTLY_MATCHES"



    
  }
}

