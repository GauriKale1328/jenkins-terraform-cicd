# Demo video script

## Introduction
"Hello, this is my CI/CD and Infrastructure as Code assignment. I have used a Flask application, Jenkins, Docker, Kubernetes, and Terraform."

## Jenkins pipeline
"Jenkins checks out the source code from GitHub, installs Python dependencies, runs automated tests, builds a Docker image, pushes the image to Docker Hub, and deploys the application to Kubernetes."

Show the Jenkins stage view and successful pytest output. Then show the pushed Docker image and Kubernetes resources.

## Terraform
"Terraform demonstrates Infrastructure as Code. The configuration declares a Docker image, a Docker network, and an Nginx container. Terraform compares the configuration with the current state using plan and provisions the declared resources using apply."

Show `terraform init`, `terraform plan`, `terraform apply`, and the Nginx page on port 8088.

## Conclusion
"This demonstrates automated application delivery through Jenkins and repeatable infrastructure provisioning through Terraform. Thank you."
