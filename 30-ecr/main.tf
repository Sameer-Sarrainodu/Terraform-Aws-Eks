resource "aws_ecr_repository" "main" {
    count = length(var.images)
    name = "${var.project}/${var.images[count.index]}"
    image_tag_mutability = "MUTABLE"
    image_scanning_configuration {
        scan_on_push = true
    }
  force_delete = true
}

resource "aws_ecr_registry_scanning_configuration" "test" {
  scan_type = "BASIC"

  rule {
    scan_frequency = "SCAN_ON_PUSH"
    repository_filter {
      filter      = "*"
      filter_type = "WILDCARD"
    }
  }

  depends_on = [aws_ecr_repository.main]
}

