# Create a new rancher2 imported Cluster 
provider "rancher2" {
  api_url    = "URL"
  access_key = "ACCESS_TOKEN"
  secret_key = "SECRET_KEY"
}

resource "rancher2_cluster" "test-eks" {
  name        = "test-eks"
  description = "test rancher2 imported cluster"
}
