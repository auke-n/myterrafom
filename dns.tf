resource "aws_route53_record" "sec_iplatinum_pro" {
  name    = "sec.iplatinum.pro"
  type    = "A"
  zone_id = "Z00084481U441RC0QQ500"
  records = [aws_instance.web-server.public_ip]
  ttl     = 60
}