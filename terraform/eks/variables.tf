variable "region" {
  description = "AWS region"
  type        = string
}

variable "username" {
  description = "AWS username to append to resource names"
  type        = string
}

variable "project" {
  type        = string
  description = "Application Name"
}

variable "events-api-container" {
  type= string
  description = "The events-api Container to Deploy."
}

variable "events-website-container" {
  type= string
  description = "The events-website Container to Deploy."
}

variable "events-db-init-container" {
  type= string
  description = "The events-db-init Container to Deploy."
}
