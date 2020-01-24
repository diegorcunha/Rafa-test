# Falconi DevOps Test

. For run the terraform in this test is necessary change some variables in the variables.tf.

- Variable region - The Default is set us-east-1 so if you like to run in other region is necessary change this.

- Variable aws_access_key - Is necessary include your AWS access key here to run in your account.

- Variable aws_secret_key - Is necessary include your AWS secret key.

- The other variables is optional, the default was set.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| amis | Base AMI to launch the instances | map | `<map>` | no |
| aws\_access\_key | Access_key for create the environment. | string | `""` | no |
| aws\_region | Define the region wherer this terraform will create the envrionment | string | `"us-east-1"` | no |
| aws\_secret\_key | Secret_key for create the environment. | string | `""` | no |
| azs |  | list | `<list>` | no |
| cidr |  | string | `"192.168.0.0/22"` | no |
| key\_name | Key name for SSH into EC2 | string | `"ClassAWS"` | no |
| name | Variable usad to create a tag name | string | `"falconitest"` | no |
| private\_subnets |  | list | `<list>` | no |
| public\_subnets |  | list | `<list>` | no |
| values\_max | Number maximum initial to create with the ASG | string | `"10"` | no |
| values\_min | Number minimum initial to create of the EC2 | string | `"2"` | no |

## Outputs

| Name | Description |
|------|-------------|
| EIP | The EIP used to connect the public and private Subnet |
| Private\_Subnet | The Private Subnet used to create EC2 |
| Public\_Subnet | The Public Subnet used to access the internet |
| VPC\_Id | The VPC ID used in this environment |
| elb | The DNS of the Loadbalance to access the application |

