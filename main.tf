resource "tfe_workspace" "ec2" {
  name         = "EC2-Workspace"
  organization = var.tfe_organization_name
  vcs_repo {
    identifier     = "${var.github_user}/AWS-and-Terraform"
    oauth_token_id = var.oauth_token_id
    branch         = var.github_branch
  }
  global_remote_state = true
  execution_mode      = "remote"
  working_directory   = "/Homework4/EC2"
}
resource "tfe_variable" "instances_to_create" {
  key          = "instances_to_create"
  value        = var.instances_to_create
  description  = "Instances to create"
  workspace_id = tfe_workspace.ec2.id
  category     = "terraform"
}
resource "tfe_variable" "instance_type" {
  key          = "instance_type"
  value        = var.instance_type
  description  = "Instances type"
  workspace_id = tfe_workspace.ec2.id
  category     = "terraform"
}
resource "tfe_variable" "bucket_name" {
  key          = "bucket_name"
  value        = var.bucket_name
  description  = "Bucket name for ALB logs"
  workspace_id = tfe_workspace.ec2.id
  category     = "terraform"
}

resource "tfe_variable" "aws_acess_key" {
  key          = "AWS_ACCESS_KEY_ID"
  value        = var.aws_acess_key
  description  = "AWS Acess Key"
  workspace_id = tfe_workspace.vpc.id
  category     = "env"
  sensitive    = true
}

resource "tfe_variable" "aws_secret_acess_key" {
  key          = "AWS_SECRET_ACCESS_KEY"
  value        = var.aws_secret_acess_key
  description  = "AWS Secret Acess Key"
  workspace_id = tfe_workspace.vpc.id
  category     = "env"
  sensitive    = true
}

resource "tfe_variable" "aws_default_region" {
  key          = "AWS_DEFAULT_REGION"
  value        = var.aws_default_region
  description  = "AWS Default Region"
  workspace_id = tfe_workspace.vpc.id
  category     = "env"
}

