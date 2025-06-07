data "aws_caller_identity" "current" {}

resource "aws_iam_role" "cicd_deploy" {
  name = "cicd-deploy-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Federated = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:oidc-provider/token.actions.githubusercontent.com"
      }
      Action = "sts:AssumeRoleWithWebIdentity"
      Condition = {
        StringEquals = {
          "token.actions.githubusercontent.com:sub" = "repo:${var.github_owner}/${var.repo_name}:ref:refs/heads/main"
        }
      }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "cicd_deploy_attach" {
  role       = aws_iam_role.cicd_deploy.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

output "execution_role_arn" {
  value = aws_iam_role.cicd_deploy.arn
}