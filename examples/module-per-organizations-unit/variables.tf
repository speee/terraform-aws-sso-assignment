variable "sso_region" {
  type        = string
  description = "Region of your AWS SSO instance."
}

variable "assignments_ou1" {
  type        = map(map(map(list(string))))
  description = "Account assignments for Organization Unit 1."
}

variable "assignments_ou2" {
  type        = map(map(map(list(string))))
  description = "Account assignments for Organization Unit 2."
}
