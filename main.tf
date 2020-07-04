data aws_route53_zone selected {
  name = var.domain_name
}

resource aws_route53_record A {
  for_each = local.A_records

  zone_id = data.aws_route53_zone.selected.zone_id
  type    = "A"

  name    = each.value["name"]
  ttl     = each.value["ttl"]
  records = each.value["records"]
}

resource aws_route53_record CNAME {
  for_each = local.CNAME_records

  zone_id = data.aws_route53_zone.selected.zone_id
  type    = "CNAME"

  name    = each.value["name"]
  ttl     = each.value["ttl"]
  records = each.value["records"]
}

resource aws_route53_record AAA {
  for_each = local.AAA_records

  zone_id = data.aws_route53_zone.selected.zone_id
  type    = "A"

  name = each.value["name"]

  alias {
    evaluate_target_health = each.value["alias"]["evaluate_target_health"]
    name                   = each.value["alias"]["name"]
    zone_id                = each.value["alias"]["zone_id"]
  }
}