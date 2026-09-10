variable "GITHUB_OWNER" {
  type        = string
  description = "GitHub owner/username"
}

variable "GITHUB_TOKEN" {
  type        = string
  sensitive   = true
  description = "GitHub PAT with repo + workflow + admin:public_key scope"
}

variable "GITHUB_REPOSITORY" {
  type        = string
  default     = "flux-gitops"
  description = "GitOps repository name"
}
