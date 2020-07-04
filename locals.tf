locals {

  A_records_tmp     = [for record in var.record_sets : record if record["type"] == "A"]
  CNAME_records_tmp = [for record in var.record_sets : record if record["type"] == "CNAME"]
  AAA_records_tmp   = [for record in var.record_sets : record if record["type"] == "AAA"]


  A_records = {
    for _, value in local.A_records_tmp :
    value["name"] => {
      name    = value["name"]
      ttl     = value["ttl"]
      records = value["record"]
    }
  }

  CNAME_records = {
    for _, value in local.CNAME_records_tmp :
    value["name"] => {
      name    = value["name"]
      ttl     = value["ttl"]
      records = value["record"]
    }
  }

  AAA_records = {
    for _, value in local.AAA_records_tmp :
    value["name"] => {
      name  = value["name"]
      alias = value["alias"]
    }
  }

}