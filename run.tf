resource "google_cloud_run_service" "default-ws" {
  name     = "default-ws"
  location = local.region

  autogenerate_revision_name = true

  template {
    spec {
      containers {
        image = "europe-west1-docker.pkg.dev/test-bits-335214/docker-public/websockets"
        env {
          name  = "REDISHOST"
          value = google_redis_instance.test-ws.host
        }
        env {
          name  = "REDISPORT"
          value = google_redis_instance.test-ws.port
        }
      }
    }
    metadata {
      annotations = {
        "run.googleapis.com/vpc-access-connector" = google_vpc_access_connector.connector.id
      }
    }
  }
}

data "google_iam_policy" "noauth" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "noauth" {
  location = google_cloud_run_service.default-ws.location
  project  = google_cloud_run_service.default-ws.project
  service  = google_cloud_run_service.default-ws.name

  policy_data = data.google_iam_policy.noauth.policy_data
}
