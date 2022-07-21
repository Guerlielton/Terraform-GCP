 
variable "credentials_file_path" {
  description = "Path to the JSON file used to describe your account credentials"
  default = "${path}/credential.json"
}

variable "region" {
  default = "us-central1"
}

variable "region_zone" {
  default = "us-central1-a"
}

variable "project_name" {
  description = "The ID of the Google Cloud project"
  default = "project-id"
}

variable "ip_white_list" {
  description = "A list of ip addresses that can be white listed through security policies"
  default     = ["192.0.2.0/24"]
}

