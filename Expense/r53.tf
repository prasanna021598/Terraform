
resource "aws_route53_record" "expense" {
    count = length(var.instance_names)
  zone_id = var.zone_id
  name    = var.instance_names[count.index] == "Frontend" ? var.domain_name : "${var.instance_names[count.index]}.${var.domain_name}"
  type    = "A"
  ttl     = 1
  records = var.instance_names[count.index] == "Frontend" ? [aws_instance.expense[count.index].public_ip] : [aws_instance.expense[count.index].private_ip]
   # it will allow to override if the record already exists instaed of giving the error
    allow_overwrite = true

}