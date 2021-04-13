variable "instance_arn" {
  type = string
}

variable "identity_store_id" {
  type = string
}

variable "organization_accounts" {
  type = list(object({
    arn   = string
    email = string
    id    = string
    name  = string
  }))
}

variable "assignments" {
  type = map(map(map(list(string))))
}
