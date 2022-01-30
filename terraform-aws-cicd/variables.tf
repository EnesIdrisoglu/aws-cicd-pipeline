variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "eu-central-1"
}
variable "env" {
  description = "Targeted Depolyment environment"
  default     = "dev"
}
variable "python_project_repository_name" {
  description = "Python Project Repository name to connect to"
  default     = "pythonapp"
}

variable "python_project_repository_branch" {
  description = "Python Project Repository branch to connect to"
  default     = "master"
}

variable "artifacts_bucket_name" {
  description = "S3 Bucket for storing artifacts"
  default     = "enesaws-cicd-pipeline"
}

variable "aws_ecs_cluster_name" {
  description = "Target Amazon ECS Cluster Name"
  default     = "MicroServicesCluster"
}

variable "aws_ecs_python_app_service_name" {
  description = "Target Amazon ECS Cluster Python App Service name"
  default     = "pythonAppService"
}
variable "cluster_name" {
  type        = string
  description = "The name of AWS ECS cluster"
  default="newcluster"
}