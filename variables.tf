

 variable "alert_conditions" {
  
  
  type = map(object({
  
   name   = string

  enabled                        = bool
 
  option                    = string
  Fillvalue                   = number
  query = string
  
  thresholdW = number
  operatorC = string
  operatorW = string

  thresholdC = number
  durationC = number
  durationW = number

  }))
}