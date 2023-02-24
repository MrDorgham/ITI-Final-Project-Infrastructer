#create private VM
resource "google_compute_instance" "private-vm2" {
  name         = "private-vm-kubectl"
  machine_type = "e2-micro"
  zone         = "us-east1-b"
 
  
  #attacht the subnet
  network_interface {
    network = google_compute_network.python-app-vpc.id
    subnetwork = google_compute_subnetwork.management_subnet.id
  }
 
  #this image will be used to install and run kubectl
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

}



