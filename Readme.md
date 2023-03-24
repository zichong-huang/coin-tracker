
# Coin Tracker Interview - HelloWorld Application

This is a sample helloworld application using GCP Cloud Run, docker, Python, Flask, Terraform and github to build. This application is running on GCP Cloud Run and do not need to manually 

## Workflow

Helloworld Repo ------> Github Action -------> Terraform ---------> GCP (Cloud Run)

You can view the application in [here](https://helloworld-kkkza5jgnq-lz.a.run.app/)


## Highlight

The CI/CD of this application have been splited into two ways:
- Cloud Build: Using Cloud Build to detect any changes on the current repo and doing the CD part for any changes under the Docker/Dockefile
- Github Action: Using Github Action to detect any changes on the repo and build the infrastructure including VPC, CloudRun, network, IAM etc. 


## Scaling

Please view the modules/cloud-run/cloud-run.tf for how I make it more scalable and highly availability.
