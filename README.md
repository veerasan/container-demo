# Terraform AWS EKS Cluster

#This terraform setup can be used to setup the AWS infrastructure
for a dockerized application running on AWS EKS Cluster

## Resources

#This setup creates the following resources:

- A new VPC with multi-zone public & private Subnets, and a single NAT gateway by using Terrafrom AWS VPC module.
- provisioned AWS EKS Cluster using Terrafrom AWS EKS module
- Stored terraform state file in S3 bucket

![EKS cluster] (https://github.com/veerasan/container-demo/blob/main/awseks-demo.png?raw=true "Infrastructure illustration")


Please find the below steps to run terraform :
- execute `terraform init --backend-config=backend.conf`, it will initialize your local terraform and connect it to the state store, and it will download all the necessary providers
- execute `terraform plan -out=awseks-demo.out` - this will calculate the changes terraform has to apply and creates a plan. If there are changes, you will see them. Check if any of the changes are expected, especially deletion of infrastructure.
- if everything looks good, you can execute the changes with `terraform apply awseks-demo.out`


## Configure kubectl
Run the following command to retrieve the access credentials for your cluster and automatically configure `kubectl`.
- `aws eks --region $(terraform output -raw region) update-kubeconfig --name $(terraform output -raw cluster_name)`

## Stateless app
- Built stateless web app using flask framework
- Created Docker image
- Created ECR repository and pushed the image to ECR repository
- Deployed stateless app in AWS EKS cluster using `kubectl apply -f ./ -R`
- Please find the artifact of stateless app

![stateless-app] (https://github.com/veerasan/container-demo/blob/main/artifact/stateless-app-output.png "Stateless app output")

## Stateful app
- Created manifest file for wordpress application
- Deployed WordPress and MySQL with Persistent Volumes in `Minikube` using `kubectl apply -f ./ -R`
- Please find the artifact of stateful app

![stateless-app] (https://github.com/veerasan/container-demo/blob/main/artifact/stateful-app-output.png "Stateful app output")
