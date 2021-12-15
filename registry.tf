resource "google_artifact_registry_repository" "docker-public" {
  provider = google-beta

  location = local.region
  repository_id = "docker-public"
  description = "Public Docker registry"
  format = "DOCKER"
}

resource "google_artifact_registry_repository_iam_member" "test-iam" {
  provider = google-beta

  location = google_artifact_registry_repository.docker-public.location
  repository = google_artifact_registry_repository.docker-public.name
  role   = "roles/artifactregistry.reader"
  member = "allUsers"
}