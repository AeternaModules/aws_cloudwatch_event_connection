output "cloudwatch_event_connections_id" {
  description = "Map of id values across all cloudwatch_event_connections, keyed the same as var.cloudwatch_event_connections"
  value       = { for k, v in aws_cloudwatch_event_connection.cloudwatch_event_connections : k => v.id if v.id != null && length(v.id) > 0 }
}
output "cloudwatch_event_connections_arn" {
  description = "Map of arn values across all cloudwatch_event_connections, keyed the same as var.cloudwatch_event_connections"
  value       = { for k, v in aws_cloudwatch_event_connection.cloudwatch_event_connections : k => v.arn if v.arn != null && length(v.arn) > 0 }
}
output "cloudwatch_event_connections_auth_parameters" {
  description = "Map of auth_parameters values across all cloudwatch_event_connections, keyed the same as var.cloudwatch_event_connections"
  value       = { for k, v in aws_cloudwatch_event_connection.cloudwatch_event_connections : k => v.auth_parameters if v.auth_parameters != null && length(v.auth_parameters) > 0 }
  sensitive   = true
}
output "cloudwatch_event_connections_authorization_type" {
  description = "Map of authorization_type values across all cloudwatch_event_connections, keyed the same as var.cloudwatch_event_connections"
  value       = { for k, v in aws_cloudwatch_event_connection.cloudwatch_event_connections : k => v.authorization_type if v.authorization_type != null && length(v.authorization_type) > 0 }
}
output "cloudwatch_event_connections_description" {
  description = "Map of description values across all cloudwatch_event_connections, keyed the same as var.cloudwatch_event_connections"
  value       = { for k, v in aws_cloudwatch_event_connection.cloudwatch_event_connections : k => v.description if v.description != null && length(v.description) > 0 }
}
output "cloudwatch_event_connections_invocation_connectivity_parameters" {
  description = "Map of invocation_connectivity_parameters values across all cloudwatch_event_connections, keyed the same as var.cloudwatch_event_connections"
  value       = { for k, v in aws_cloudwatch_event_connection.cloudwatch_event_connections : k => v.invocation_connectivity_parameters if v.invocation_connectivity_parameters != null && length(v.invocation_connectivity_parameters) > 0 }
}
output "cloudwatch_event_connections_kms_key_identifier" {
  description = "Map of kms_key_identifier values across all cloudwatch_event_connections, keyed the same as var.cloudwatch_event_connections"
  value       = { for k, v in aws_cloudwatch_event_connection.cloudwatch_event_connections : k => v.kms_key_identifier if v.kms_key_identifier != null && length(v.kms_key_identifier) > 0 }
}
output "cloudwatch_event_connections_name" {
  description = "Map of name values across all cloudwatch_event_connections, keyed the same as var.cloudwatch_event_connections"
  value       = { for k, v in aws_cloudwatch_event_connection.cloudwatch_event_connections : k => v.name if v.name != null && length(v.name) > 0 }
}
output "cloudwatch_event_connections_region" {
  description = "Map of region values across all cloudwatch_event_connections, keyed the same as var.cloudwatch_event_connections"
  value       = { for k, v in aws_cloudwatch_event_connection.cloudwatch_event_connections : k => v.region if v.region != null && length(v.region) > 0 }
}
output "cloudwatch_event_connections_secret_arn" {
  description = "Map of secret_arn values across all cloudwatch_event_connections, keyed the same as var.cloudwatch_event_connections"
  value       = { for k, v in aws_cloudwatch_event_connection.cloudwatch_event_connections : k => v.secret_arn if v.secret_arn != null && length(v.secret_arn) > 0 }
}

