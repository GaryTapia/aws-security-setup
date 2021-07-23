resource "aws_securityhub_account" "SecurityHub" {}


# resource "aws_securityhub_member" "SecurityHub_Addon_Member" {
#   depends_on = [aws_securityhub_account.SecurityHub]
#   #account_id = var.SECURITY_ACCOUNT_ID
#   email      = var.CONTACT_EMAIL
#   invite     = true
# }

# resource "aws_securityhub_account" "invitee" {
#   provider = "aws.invitee"
# }

# resource "aws_securityhub_invite_accepter" "invitee" {
#   provider   = "aws.invitee"
#   depends_on = [aws_securityhub_account.accepter]
#   master_id  = aws_securityhub_member.SecurityHub_Addon_Member.master_id
# }