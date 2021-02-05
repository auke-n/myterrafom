resource "aws_route53_zone" "sec_iplatinum_pro" {
  name = "sec.iplatinum.pro"
}
resource "aws_route53_record" "sec_iplatinum_pro" {
  name    = "sec.iplatinum.pro"
  type    = "A"
  zone_id = aws_route53_zone.sec_iplatinum_pro.zone_id
  records = ["44.192.67.165"]
  ttl     = 60
}