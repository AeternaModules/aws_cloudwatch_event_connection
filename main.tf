resource "aws_cloudwatch_event_connection" "cloudwatch_event_connections" {
  for_each = var.cloudwatch_event_connections

  authorization_type = each.value.authorization_type
  name               = each.value.name
  description        = each.value.description
  kms_key_identifier = each.value.kms_key_identifier
  region             = each.value.region

  auth_parameters {
    dynamic "api_key" {
      for_each = each.value.auth_parameters.api_key != null ? [each.value.auth_parameters.api_key] : []
      content {
        key   = api_key.value.key
        value = api_key.value.value
      }
    }
    dynamic "basic" {
      for_each = each.value.auth_parameters.basic != null ? [each.value.auth_parameters.basic] : []
      content {
        password = basic.value.password
        username = basic.value.username
      }
    }
    dynamic "connectivity_parameters" {
      for_each = each.value.auth_parameters.connectivity_parameters != null ? [each.value.auth_parameters.connectivity_parameters] : []
      content {
        resource_parameters {
          resource_configuration_arn = connectivity_parameters.value.resource_parameters.resource_configuration_arn
        }
      }
    }
    dynamic "invocation_http_parameters" {
      for_each = each.value.auth_parameters.invocation_http_parameters != null ? [each.value.auth_parameters.invocation_http_parameters] : []
      content {
        dynamic "body" {
          for_each = invocation_http_parameters.value.body != null ? invocation_http_parameters.value.body : []
          content {
            is_value_secret = body.value.is_value_secret
            key             = body.value.key
            value           = body.value.value
          }
        }
        dynamic "header" {
          for_each = invocation_http_parameters.value.header != null ? invocation_http_parameters.value.header : []
          content {
            is_value_secret = header.value.is_value_secret
            key             = header.value.key
            value           = header.value.value
          }
        }
        dynamic "query_string" {
          for_each = invocation_http_parameters.value.query_string != null ? invocation_http_parameters.value.query_string : []
          content {
            is_value_secret = query_string.value.is_value_secret
            key             = query_string.value.key
            value           = query_string.value.value
          }
        }
      }
    }
    dynamic "oauth" {
      for_each = each.value.auth_parameters.oauth != null ? [each.value.auth_parameters.oauth] : []
      content {
        authorization_endpoint = oauth.value.authorization_endpoint
        dynamic "client_parameters" {
          for_each = oauth.value.client_parameters != null ? [oauth.value.client_parameters] : []
          content {
            client_id     = client_parameters.value.client_id
            client_secret = client_parameters.value.client_secret
          }
        }
        http_method = oauth.value.http_method
        oauth_http_parameters {
          dynamic "body" {
            for_each = oauth.value.oauth_http_parameters.body != null ? oauth.value.oauth_http_parameters.body : []
            content {
              is_value_secret = body.value.is_value_secret
              key             = body.value.key
              value           = body.value.value
            }
          }
          dynamic "header" {
            for_each = oauth.value.oauth_http_parameters.header != null ? oauth.value.oauth_http_parameters.header : []
            content {
              is_value_secret = header.value.is_value_secret
              key             = header.value.key
              value           = header.value.value
            }
          }
          dynamic "query_string" {
            for_each = oauth.value.oauth_http_parameters.query_string != null ? oauth.value.oauth_http_parameters.query_string : []
            content {
              is_value_secret = query_string.value.is_value_secret
              key             = query_string.value.key
              value           = query_string.value.value
            }
          }
        }
      }
    }
  }

  dynamic "invocation_connectivity_parameters" {
    for_each = each.value.invocation_connectivity_parameters != null ? [each.value.invocation_connectivity_parameters] : []
    content {
      resource_parameters {
        resource_configuration_arn = invocation_connectivity_parameters.value.resource_parameters.resource_configuration_arn
      }
    }
  }
}

