# Jenkins + Terraform CI/CD Assignment

A beginner-friendly demonstration using a small Flask application.

- **Jenkins** automates checkout, dependency installation, tests, Docker image build, Docker Hub push, and Kubernetes deployment.
- **Terraform** demonstrates Infrastructure as Code by provisioning a local Docker image, network, and Nginx container.

> The Terraform example provisions local Docker resources. The Jenkins pipeline deploys the Flask application to Kubernetes. These are two separate demonstrations in this assignment.

## Repository structure

```text
.
├── app.py
├── tests/test_app.py
├── requirements.txt
├── requirements-dev.txt
├── Dockerfile
├── Jenkinsfile
├── k8s/
│   ├── deployment.yaml
│   └── service.yaml
├── terraform/
│   ├── versions.tf
│   ├── variables.tf
│   ├── main.tf
│   ├── outputs.tf
│   └── terraform.tfvars.example
└── screenshots/
```

## 1. Run Flask locally

Requirements: Python 3.10+.

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt -r requirements-dev.txt
python -m pytest -v
python app.py
```

Open `http://localhost:5000` and `http://localhost:5000/health`.

On Windows PowerShell, activate with:

```powershell
.venv\Scripts\Activate.ps1
```

## 2. Build and run with Docker

```bash
docker build -t flask-cicd-app:local .
docker run --rm -p 5000:5000 flask-cicd-app:local
```

## 3. Jenkins setup

The Jenkins build agent needs Git, Python 3 + pip, Docker CLI with access to a running Docker daemon, `kubectl`, and network access to the Kubernetes API.

Create these Jenkins credentials:
1. ID **`dockerhub-creds`** — type *Username with password*. Use your Docker Hub username and a Docker Hub access token.
2. ID **`kubeconfig-file`** — type *Secret file*. Upload a kubeconfig file that can access your target Kubernetes cluster.

Edit `DOCKERHUB_REPO` near the top of `Jenkinsfile`. Replace `YOUR_DOCKERHUB_USERNAME` with your Docker Hub username, for example `gauri0047/flask-cicd-app`.

Create a Pipeline job in Jenkins, choose **Pipeline script from SCM**, select Git, enter this repository URL, branch `main`, and script path `Jenkinsfile`. Run **Build Now** and inspect the stage results.

Important: Jenkins must be able to reach the Docker daemon and Kubernetes cluster from its build agent. A kubeconfig pointing to `localhost` on your laptop will not work from a remote Jenkins agent. Configure a reachable cluster endpoint and secure credentials before running deployment.

The Kubernetes stage applies the Deployment and Service, then waits for the rollout. The Service uses NodePort `30008` if that port is available in your cluster.

## 4. Terraform setup

Requirements: Terraform 1.5+ and a running Docker daemon accessible to Terraform.

From the repository root:

```bash
cd terraform
terraform init
terraform fmt -check
terraform validate
terraform plan
terraform apply
```

Review the plan, then type `yes` when prompted. Terraform creates an Nginx Docker image, a Docker network named `terraform-demo-network`, and a container named `terraform-demo-nginx` mapped to host port `8088`.

Open `http://localhost:8088` to see the Nginx welcome page.

To remove the resources created by this demonstration:

```bash
terraform destroy
```

Review the destroy plan and type `yes` when prompted.

Do not commit Terraform state files or secrets. `.gitignore` excludes state files and the `.terraform` directory.

## 5. Evidence to capture

Save your own screenshots in `screenshots/`:
1. Jenkins job configuration showing repository and `Jenkinsfile` path (hide credentials).
2. Jenkins pipeline with successful stages.
3. Test stage showing pytest passing.
4. Docker Hub repository showing the pushed image tag.
5. Kubernetes deployment and pods running (`kubectl get deployments,pods,svc`).
6. `terraform init` completed.
7. `terraform plan` showing resources to add.
8. `terraform apply` showing resources created and outputs.
9. Nginx page at `http://localhost:8088`.

Never include passwords, access tokens, or private kubeconfig contents in screenshots or GitHub.

## 6. Demo video outline

1. Introduce the Flask application and repository.
2. Explain Jenkins stages: checkout, install, test, build, push, deploy.
3. Trigger a Jenkins build and show successful stages and test output.
4. Show the Docker Hub image and Kubernetes deployment.
5. Explain Terraform files and the Docker image/network/container resources.
6. Show `terraform plan`, `terraform apply`, and the Nginx page.
7. Explain that Terraform resources can be removed with `terraform destroy`.



## Demo video

Add your video URL here after uploading it:

`PASTE_YOUR_DEMO_VIDEO_LINK_HERE`
