variable "region" {
  description = "AWS region"
  type = string
  default = "us-west-1"
}

variable "sns_topic_name" {
  description = "Name for AWS SNS topic"
  type = string
  default = "Hello_world_topic"
}

variable "notification_email" {
  description = "E-mail address that will recieve notifications from SNS topic"
  type = string
  default = "marjanovic.galaxy@gmail.com"
}

variable "schedule_expression" {
  description = "Cron expression for trigering lambda"
  type = string
  default = "cron(0 1 * * ? *)"
}

variable "event_target_id" {
  description = "The unique target assignment ID"
  type = string
  default = "hello_world_trigger"
}