
# Coin Tracker Interview - HelloWorld Application

This is a sample helloworld application using GCP Cloud Run, docker, Python, Flask, Terraform and github to build. This application is running on GCP Cloud Run and do not need to manually deploy using your own local machine. Because Cloud Run is a serverless compute platform that allows developers to deploy and run containerized applications without having to worry about the underlying infrastructure. There are several benefits to using Cloud Run:

Scalability: Cloud Run allows applications to scale automatically in response to changes in traffic or workload. This means that the application can handle spikes in traffic without any manual intervention.

Cost-effectiveness: With Cloud Run, you only pay for the exact amount of compute resources used by your application, making it a cost-effective option compared to traditional virtual machines or container orchestration platforms.

Easy deployment: Cloud Run makes it easy to deploy and run containerized applications with just a few clicks. You can deploy applications from a container registry or build and deploy them directly from source code.

Portability: Cloud Run supports containers built using any programming language or framework, making it a flexible option for developers who want to use their preferred development tools.

Security: Cloud Run provides built-in security features such as automatic TLS encryption and identity and access management (IAM) integration, making it easy to secure your applications.

Integration: Cloud Run integrates with other Google Cloud services such as Cloud Storage, Cloud SQL, and Cloud Pub/Sub, making it easy to build and deploy complex applications that use multiple services.

## Manual testing:
Although I have enabled CI/CD for this application, but here is the way you could manually deploy if you prefer:

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
