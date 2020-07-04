
variable all_domains {
    value = [
        {
            aws_region = "eu-west-1"
            aws_profile = "default"

            domain_name = "domain.com"

            record_sets = [
                {
                    type = "A"
                    name = "pet.domain.com"
                    ttl  = 300
                    record = ["10.0.0.15"]
                },
                {
                    type = "CNAME"
                    name = "google.domain.com"
                    ttl  = 300
                    record = ["google.com"]
                },
                {
                    type = "AAA" 
                    name = "lb.domain.com"
                    alias = {
                        evaluate_target_health = false
                        name = "xxxx.eu-west-1.elb.amazonaws.com."
                        zone_id = "xxxxxxxx"
                    }
                }
            ]
        }
    ]
}


module all_my_domains {

    source = "../"

    for_each = var.all_domains

    aws_region = each.value["aws_region"]
    aws_profile = each.value["aws_profile"]

    domain_name = each.value["domain_name"]
    record_sets = each.value["record_sets"]
}