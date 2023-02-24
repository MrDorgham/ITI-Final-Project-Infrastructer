#create new vpc
resource "google_compute_network" "python-app-vpc" {
  name                    = "python-app-vpc"
  routing_mode            = "REGIONAL"
  auto_create_subnetworks = false
}