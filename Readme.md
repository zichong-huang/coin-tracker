
# Coin Tracker Interview - HelloWorld Application

This is a sample helloworld application using GCP Cloud Run, docker, Python, Flask, Terraform and github to build. This application is running on GCP Cloud Run and do not need to manually deploy using your own local machine. But here is the way you could manually deploy if you prefer:

## Build Docker image (Assume you have a GCP service account authorizte already): 
### Build the Docker image
```docker build -t gcr.io/coin-tracker-381614/hello-world .```

### Push the Docker image to GCR
```docker push gcr.io/coin-tracker-381614/hello-world```

## Run Terraform to apply
```bash
# Initialize the Terraform configuration
terraform init

# Preview the changes to be made
terraform plan 

# Apply the changes to create the Cloud Run service
terraform apply 
```

## Workflow

Helloworld Repo ------> Github Action -------> Terraform ---------> GCP (Cloud Run)

You can view the application in [here](https://helloworld-kkkza5jgnq-lz.a.run.app/), or do the the a simple curl command like 

```bash
% curl https://helloworld-kkkza5jgnq-lz.a.run.app/
>Hello World!
```

## Highlight

The CI/CD of this application have been splited into two ways:
- Cloud Build: Using Cloud Build to detect any changes on the current repo and doing the CD part for any changes under the Docker/Dockefile
- Github Action: Using Github Action to detect any changes on the repo and build the infrastructure including VPC, CloudRun, network, IAM etc. 


## Scaling

Please view the modules/cloud-run/cloud-run.tf for how I make it more scalable and highly availability.
