# Terraform AWS EKS Cluster

This terraform setup can be used to setup the AWS infrastructure
for a dockerized application running on AWS EKS Cluster

## Resources

This setup creates the following resources:

- A new VPC with multi-zone public & private Subnets, and a single NAT gateway by using Terrafrom AWS VPC module.
- provisioned AWS EKS Cluster using Terrafrom AWS EKS module
- Stored terraform state file in S3 bucket

![example](https://d2908q01vomqb2.cloudfront.net/1b6453892473a467d07372d45eb05abc2031647a/2018/01/26/Slide5.png "Infrastructure illustration")
(Source: https://aws.amazon.com/de/blogs/compute/task-networking-in-aws-fargate/)

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

## Stateful app
- Created manifest file for wordpress application
- Deployed WordPress and MySQL with Persistent Volumes in `Minikube` using `kubectl apply -f ./ -R`
- Please find the artifact of stateful app
