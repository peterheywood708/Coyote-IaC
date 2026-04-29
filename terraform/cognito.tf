
resource "aws_cognito_user_pool" "coyote_user_pool" {
  name                     = local.cognitoUserPoolName
  alias_attributes         = ["email"]
  auto_verified_attributes = ["email"]
  deletion_protection      = "ACTIVE"
  schema {
    attribute_data_type      = "String"
    developer_only_attribute = false
    mutable                  = true
    name                     = "email"
    required                 = true
    string_attribute_constraints {
      max_length = "2048"
      min_length = "0"
    }
  }
  schema {
    attribute_data_type      = "String"
    developer_only_attribute = false
    mutable                  = true
    name                     = "given_name"
    required                 = true
    string_attribute_constraints {
      max_length = "2048"
      min_length = "0"
    }
  }
  schema {
    attribute_data_type      = "String"
    developer_only_attribute = false
    mutable                  = true
    name                     = "name"
    required                 = true

    string_attribute_constraints {
      max_length = "2048"
      min_length = "0"
    }
  }
  schema {
    attribute_data_type      = "String"
    developer_only_attribute = false
    mutable                  = true
    name                     = "family_name"
    required                 = true
    string_attribute_constraints {
      max_length = "2048"
      min_length = "0"
    }
  }
  username_configuration {
    case_sensitive = false
  }
}

resource "aws_cognito_user_pool_client" "coyote_app_client" {
  name         = local.AppClientName
  user_pool_id = aws_cognito_user_pool.coyote_user_pool.id
  explicit_auth_flows = [
    "ALLOW_REFRESH_TOKEN_AUTH",
    "ALLOW_USER_SRP_AUTH",
    "ALLOW_USER_AUTH",
  ]
  token_validity_units {
    access_token  = "minutes"
    id_token      = "minutes"
    refresh_token = "days"
  }
  allowed_oauth_scopes         = ["email", "openid", "phone"]
  default_redirect_uri         = var.defaultRedirectUri
  callback_urls                = var.callbackUrls
  allowed_oauth_flows          = ["code"]
  access_token_validity        = 10
  refresh_token_validity       = 5
  id_token_validity            = 60
  supported_identity_providers = ["COGNITO"]
  enable_token_revocation      = true
}
