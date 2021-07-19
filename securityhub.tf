resource "aws_securityhub_account" "SecurityHub" {}


resource "aws_securityhub_member" "SecurityHub_Addon_Member" {
  depends_on = [aws_securityhub_account.SecurityHub]
  account_id = var.SECURITY_ACCOUNT_ID
  email      = var.CONTACT_EMAIL
  invite     = true
}