variable "location" {
  type        = string
  description = "Azure regio"
  default     = "West Europe"
}

variable "lastname" {
  type        = string
  description = "Lastname of the person deploying the resources"
  default = "lastname"
}

variable "address_prefixes" {
  type = list(string)
  default = [ "address_prefixes" ]
}