module "kind_cluster" {
  source = "github.com/den-vasyliev/tf-kind-cluster"
}

module "tls_private_key" {
  source = "github.com/den-vasyliev/tf-hashicorp-tls-keys"
}

module "github_repository" {
  source                   = "github.com/den-vasyliev/tf-github-repository"
  github_owner             = var.GITHUB_OWNER
  github_token             = var.GITHUB_TOKEN
  repository_name          = var.GITHUB_REPOSITORY
  public_key_openssh       = module.tls_private_key.public_key_openssh
  public_key_openssh_title = "flux"
}

module "flux_bootstrap" {
  source            = "github.com/den-vasyliev/tf-fluxcd-flux-bootstrap"
  github_repository = "${var.GITHUB_OWNER}/${var.GITHUB_REPOSITORY}"
  private_key       = module.tls_private_key.private_key_pem
  config_path       = "~/.kube/config"
  github_token      = var.GITHUB_TOKEN

}
