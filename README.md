# faasd for Vultr

This repo contains a Terraform Module for deploying a [faasd](https://github.com/openfaas/faasd) instance on
[Vultr](https://www.vultr.com/) using [Terraform](https://www.terraform.io/).

__faasd__, a lightweight & portable faas engine, is [OpenFaaS](https://github.com/openfaas/) reimagined, but without the cost and complexity of Kubernetes. It runs on a single host with very modest requirements, making it fast and easy to manage. Under the hood it uses [containerd](https://containerd.io/) and [Container Networking Interface (CNI)](https://github.com/containernetworking/cni) along with the same core OpenFaaS components from the main project.

## What's a Terraform Module?

A Terraform Module refers to a self-contained packages of Terraform configurations that are managed as a group. This repo
is a Terraform Module and contains many "submodules" which can be composed together to create useful infrastructure patterns.

## How do you use this module?

This repository defines a [Terraform module](https://www.terraform.io/docs/modules/usage.html), which you can use in your
code by adding a `module` configuration and setting its `source` parameter to URL of this repository:

```hcl
module "faasd" {
  source = "https://github.com/ittrident/terraform-vultr-faasd"
  name   = "faasd"
}
```

## Requirements

| Name | Version |
| ---- | ------- |
| terraform | >=1.0.0 |
| vultr | >=2.10.1 |
| random | >=3.1.2 |

## Providers

|Name | Version |
| --- | ------- |
| vultr | >=2.10.1 |
| random | >=3.1.2 |

## Terraform Resources

| Name | Type |
| ---------| ------------|
| [vultr_instance](https://registry.terraform.io/providers/vultr/vultr/latest/docs/resources/instance) | Resource |
| [vultr_ssh_key](https://registry.terraform.io/providers/vultr/vultr/latest/docs/resources/ssh_key) | Resource |
| [vultr_firewall_group](https://registry.terraform.io/providers/vultr/vultr/latest/docs/resources/firewall_group) | Resource |
| [vultr_firewall_rule](https://registry.terraform.io/providers/vultr/vultr/latest/docs/resources/firewall_rule) | Resource | 
| [random_password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | Resource |

## Terraform Variables
 Edit the `vars.tf` file to add the variables as per your need.

| Name | Description | Type | Required|
| ---- | ----------- | ---- | ------- |
| `api_key` | Enter your vultr api key to create the resource | string | yes |
| `OS` | Set the operating system | number | yes
| `plan` | Set the Vultr instance specification | string | yes |
| `region` | Vultr instance region | string | yes |
| `label` | Vultr server name labelling | string | no |
| `public_key` | Set the publickey value for the vultr instance from the host machine |  string | yes |
| `domain` | Enter your domain name |  string | no |
| `basic_auth_password` | Randomly generate 16 digit password | string | no |
| `hostname` | Set the hostname for instance | string | no |
| `email` | Set the email | string | no |
| `ufw_enabled` | Flag to indicate if UFW (Uncomplicated Firewall) should be enabled or not | bool | no |

## Output

| Name | Description |
| ---- | ----------- |
| gateway_url | The url of the faasd gateway. |
| user_name | The basic auth user name. |
| password | The basic auth password. |
| instance_ip | The public IP address of the faasd instance. |

## See Also

- [faasd on Amazon Web Services with Terraform](https://github.com/jsiebens/terraform-aws-faasd)
- [faasd on Google Cloud Platform with Terraform](https://github.com/jsiebens/terraform-google-faasd)
- [faasd on Microsoft Azure with Terraform](https://github.com/jsiebens/terraform-azurerm-faasd)
- [faasd on DigitalOcean with Terraform](https://github.com/jsiebens/terraform-digitalocean-faasd)
- [faasd on Equinix Metal with Terraform](https://github.com/jsiebens/terraform-equinix-faasd)
- [faasd on Scaleway with Terraform](https://github.com/jsiebens/terraform-scaleway-faasd)
- [faasd on Exoscale with Terraform](https://github.com/itTrident/terraform-exoscale-faasd)
- [faasd on Linode with Terraform](https://github.com/itTrident/terraform-linode-faasd)
