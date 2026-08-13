variable "cloudwatch_event_connections" {
  description = <<EOT
Map of cloudwatch_event_connections, attributes below
Required:
    - authorization_type
    - name
    - auth_parameters (block):
        - api_key (optional, block):
            - key (required)
            - value (required)
        - basic (optional, block):
            - password (required)
            - username (required)
        - connectivity_parameters (optional, block):
            - resource_parameters (required, block):
                - resource_configuration_arn (required)
        - invocation_http_parameters (optional, block):
            - body (optional, block):
                - is_value_secret (optional)
                - key (optional)
                - value (optional)
            - header (optional, block):
                - is_value_secret (optional)
                - key (optional)
                - value (optional)
            - query_string (optional, block):
                - is_value_secret (optional)
                - key (optional)
                - value (optional)
        - oauth (optional, block):
            - authorization_endpoint (required)
            - client_parameters (optional, block):
                - client_id (required)
                - client_secret (required)
            - http_method (required)
            - oauth_http_parameters (required, block):
                - body (optional, block):
                    - is_value_secret (optional)
                    - key (optional)
                    - value (optional)
                - header (optional, block):
                    - is_value_secret (optional)
                    - key (optional)
                    - value (optional)
                - query_string (optional, block):
                    - is_value_secret (optional)
                    - key (optional)
                    - value (optional)
Optional:
    - description
    - kms_key_identifier
    - region
    - invocation_connectivity_parameters (block):
        - resource_parameters (required, block):
            - resource_configuration_arn (required)
EOT

  type = map(object({
    authorization_type = string
    name               = string
    description        = optional(string)
    kms_key_identifier = optional(string)
    region             = optional(string)
    auth_parameters = object({
      api_key = optional(object({
        key   = string
        value = string
      }))
      basic = optional(object({
        password = string
        username = string
      }))
      connectivity_parameters = optional(object({
        resource_parameters = object({
          resource_configuration_arn = string
        })
      }))
      invocation_http_parameters = optional(object({
        body = optional(list(object({
          is_value_secret = optional(bool)
          key             = optional(string)
          value           = optional(string)
        })))
        header = optional(list(object({
          is_value_secret = optional(bool)
          key             = optional(string)
          value           = optional(string)
        })))
        query_string = optional(list(object({
          is_value_secret = optional(bool)
          key             = optional(string)
          value           = optional(string)
        })))
      }))
      oauth = optional(object({
        authorization_endpoint = string
        client_parameters = optional(object({
          client_id     = string
          client_secret = string
        }))
        http_method = string
        oauth_http_parameters = object({
          body = optional(list(object({
            is_value_secret = optional(bool)
            key             = optional(string)
            value           = optional(string)
          })))
          header = optional(list(object({
            is_value_secret = optional(bool)
            key             = optional(string)
            value           = optional(string)
          })))
          query_string = optional(list(object({
            is_value_secret = optional(bool)
            key             = optional(string)
            value           = optional(string)
          })))
        })
      }))
    })
    invocation_connectivity_parameters = optional(object({
      resource_parameters = object({
        resource_configuration_arn = string
      })
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.cloudwatch_event_connections : (
        v.auth_parameters.oauth == null || ((length(v.auth_parameters.oauth.authorization_endpoint) >= 1 && length(v.auth_parameters.oauth.authorization_endpoint) <= 2048))
      )
    ])
    error_message = "all of: must be between 1 and 2048 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.cloudwatch_event_connections : (
        v.kms_key_identifier == null || ((length(v.kms_key_identifier) >= 0 && length(v.kms_key_identifier) <= 2048) && (can(regex("^[a-zA-Z0-9_\\-/:]*$", v.kms_key_identifier))))
      )
    ])
    error_message = "all of: must be between 0 and 2048 characters"
  }
  # Note: 12 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

