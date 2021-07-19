variable "AWS_ACCESS_KEY" {

}
variable "AWS_SECRET_KEY" {

}
variable "AWS_REGION" {
    default = "us-west-2"
}

variable "AMIS" {
    type = map(string)
    default = {
        us-east-1 = "ami-04bcdd2a9f28dcc3a"
        us-east-2 = "ami-06a7592e8b55afe98"
        us-west-1 = "ami-0a1a02c21dbaf286d"
        us-west-2 = "ami-0db01fabda16f6445"
    }
}

variable "ACCOUNT" {

}

variable "SECURITY_ACCOUNT_ID" {

}

variable "CONTACT_EMAIL" {
    
}