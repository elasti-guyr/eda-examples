# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

cluster_name = "<SLURM Cluster Name>"
project      = "<GCP Project Name>"
zone         = "<GCP Zone>"

network_name            = "<GCP Network Name>"
subnetwork_name         = "<GCP Subnet Name>"
# shared_vpc_host_project = "<vpc host project>"

disable_controller_public_ips = false
disable_login_public_ips      = false
# disable_compute_public_ips    = true

# ompi_version  = null # e.g. v3.1.x
# slurm_version = "19.05-latest"
slurm_version = "b:slurm-19-05-8-1"
# suspend_time  = 300

# controller_machine_type = "n1-standard-2"
# controller_disk_type    = "pd-standard"
# controller_disk_size_gb = 50
# controller_labels = {
#   key1 = "val1"
#   key2 = "val2"
# }
# controller_service_account = "default"
# controller_scopes          = ["https://www.googleapis.com/auth/cloud-platform"]
# cloudsql = {
#   server_ip = "<cloudsql ip>"
#   user      = "slurm"
#   password  = "verysecure"
#   db_name   = "slurm_accounting"
# }
# controller_secondary_disk      = false
# controller_secondary_disk_size = 100
# controller_secondary_disk_type = "pd-ssd"

# login_machine_type = "n1-standard-2"
# login_disk_type    = "pd-standard"
# login_disk_size_gb = 20
# login_labels = {
#   key1 = "val1"
#   key2 = "val2"
# }
# login_node_count = 1
# login_node_service_account = "default"
# login_node_scopes          = [
#   "https://www.googleapis.com/auth/monitoring.write",
#   "https://www.googleapis.com/auth/logging.write"
# ]


# Optional network storage fields
# network_storage is mounted on all instances
# login_network_storage is mounted on controller and login instances
network_storage = [{
    server_ip     = "<GCP CVO Data Interface IP>"
    remote_mount  = "<GCP CVO Volume name to mount to>"
    local_mount   = "/mnt"
    fs_type       = "nfs"
    mount_options = "defaults,hard,intr"
  },{
    server_ip     = "<GCP CVO Data Interface IP>"
    remote_mount  = "<GCP CVO Volume name to mount to>"
    local_mount   = "/tools"
    fs_type       = "nfs"
    mount_options = "defaults,hard,intr"
}]
#
# login_network_storage = [{
#   server_ip     = "<storage host>"
#   remote_mount  = "/net_storage"
#   local_mount   = "/shared"
#   fs_type       = "nfs"
#   mount_options = null
# }]

# compute_image_machine_type = "n1-standard-2"
# compute_image_disk_type    = "pd-standard"
# compute_image_disk_size_gb = 20
# compute_image_labels = {
#   key1 = "val1"
#   key2 = "val2"
# }

# compute_node_service_account = "default"
# compute_node_scopes          = [
#   "https://www.googleapis.com/auth/monitoring.write",
#   "https://www.googleapis.com/auth/logging.write"
# ]

partitions = [
  { name                 = "debug"
    machine_type         = "n1-standard-2"
    static_node_count    = 0
    max_node_count       = <Number of Workers to deploy>
    zone                 = "<GCP Zone>"
    compute_disk_type    = "pd-standard"
    compute_disk_size_gb = 20
    compute_labels       = {}
    cpu_platform         = null
    gpu_count            = 0
    gpu_type             = null
    network_storage      = []
    preemptible_bursting = false
    vpc_subnet           = "<GCP Subnet Name>"
  },
#  { name                 = "partition2"
#    machine_type         = "n1-standard-16"
#    static_node_count    = 0
#    max_node_count       = 20
#    zone                 = "us-west1-b"
#    compute_disk_type    = "pd-ssd"
#    compute_disk_size_gb = 20
#    compute_labels       = {
#      key1 = "val1"
#      key2 = "val2"
#    }
#    cpu_platform         = "Intel Skylake"
#    gpu_count            = 8
#    gpu_type             = "nvidia-tesla-v100"
#    network_storage      = [{
#      server_ip     = "none"
#      remote_mount  = "<gcs bucket name>"
#      local_mount   = "/data"
#      fs_type       = "gcsfuse"
#      mount_options = "file_mode=664,dir_mode=775,allow_other"
#    }]
#    preemptible_bursting = true
#    vpc_subnet           = null
]
