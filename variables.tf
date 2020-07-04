variable aws_region {
  type        = string
  description = "Region for the module provider"
}

variable aws_profile {
  type        = string
  description = "The CLI profile to use for this Hosted Zone"
}

variable domain_name {
  type        = string
  description = "Need this to lookup the hosted zone that needs to be managed"
}

variable record_sets {
  description = "The list of records that needs to be added to the domian"
}