#create management subnet for VM
resource "google_compute_subnetwork" "management_subnet" {
  name          = "management-subnet"
  ip_cidr_range = "10.0.0.0/24"
  region        = "us-east1"
  network       = google_compute_network.python-app-vpc.id
}

#create restricted subnet for GKE
resource "google_compute_subnetwork" "restricted_subnet" {
  name          = "restricted-subnet"
  ip_cidr_range = "10.0.1.0/24"
  region        = "us-east1"
  network       = google_compute_network.python-app-vpc.id

  #allow private google access to communicate with gcp resources
  private_ip_google_access = true
}



# resource "google_compute_subnetwork" "python-app-subnets" {
#   for_each = var.subnets
#   name = each.value["name"]
#   ip_cidr_range = each.value["ip_cidr_range"]
#   private_ip_google_access = each.value["private_ip_google_access"]

# }