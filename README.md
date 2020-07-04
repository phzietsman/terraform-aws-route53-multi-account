# AWS Route53 Multi Account
Module to help manage Hosted Zones in different accounts by managing its own provider. This is only an example, it does not support all the [aws_route53_record](https://www.terraform.io/docs/providers/aws/r/route53_record.html) arguments ond only supports A, CNAME and Alias (AAA) record types.

## Example

You can have multiple of these blocks when using Terraform 12, TF13 however supports looping over modules and you can have a single variable and module (see examples folder).

```hcl
module my_main_account_domain {

    source = "../"

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

```