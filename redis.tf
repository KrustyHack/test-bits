resource "google_redis_instance" "test-ws" {
  name           = "test-ws"
  memory_size_gb = 1
  region         = local.region
}
