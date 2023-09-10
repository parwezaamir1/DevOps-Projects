
resource "github_repository" "example" {
  name        = "example"
  description = "My awesome codebase"

  visibility = "public"
  auto_init  = true
}

output "url" {
  value = github_repository.example.html_url
}