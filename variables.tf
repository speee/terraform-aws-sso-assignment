variable "instance_arn" {
  type        = string
  description = "The Amazon Resource Name (ARN) of the SSO Instance under which the operation will be executed."
}

variable "identity_store_id" {
  type        = string
  description = "The Identity Store ID associated with the Single Sign-On Instance."
}

variable "organization_accounts" {
  type = list(object({
    arn   = string
    email = string
    id    = string
    name  = string
  }))
  description = "List of information of accounts which belongs to AWS Organizations."
}

variable "assignments" {
  type        = map(map(map(list(string))))
  description = "Configuration variable for account assignments."
}
