module "environment" {
  source                              = "github.com/karlkeppner1/terraform-project-module?ref=v1.0.0"
  project_id                          = "abridge-demo"
  regions                             = ["us-west1", "us-west2", "us-west3", "us-west4", "us-east1", "us-east4", "us-east5", "us-central1", "us-south1"]
  subnetwork_private_ip_google_access = true
  vpc_cidr                            = "10.0.0.0/16"
  vpc_name                            = "gke-env"
  kms_crypto_key_name                 = "gke-crypto-key4"
  kms_key_ring_name                   = "gke-key-ring4"

  cluster_node_config = {
    disk_size_gb = 50
    disk_type    = "pd-balanced"
    machine_type = "e2-medium"
  }
  cluster_autoscaling = {
    location_policy      = "ANY"
    max_node_count       = 3
    min_node_count       = 0
    total_max_node_count = 0
    total_min_node_count = 0
  }
}
