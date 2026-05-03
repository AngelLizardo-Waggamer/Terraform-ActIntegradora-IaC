output "repository_url" {
  description = "Full URL of the ECR repository (account.dkr.ecr.region.amazonaws.com/repo-name)"
  value       = aws_ecr_repository.this.repository_url
}
