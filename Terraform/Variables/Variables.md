
# Terraform Variables - 

## What Are Variables in Terraform?

Variables in Terraform are used to make your configurations more dynamic and flexible by parameterizing input values instead of hardcoding them.

---

##  Why Use Variables?

- Reusability of code
- Flexibility in different environments
- Better separation of configuration and data
- Easier to manage secrets and sensitive values

---

##  Types of Variables

| Type    | Description |
|---------|-------------|
| `string` | Simple text value |
| `number` | Numeric value |
| `bool`   | Boolean (true or false) |
| `list(type)` | Ordered sequence of elements |
| `map(type)`  | Collection of key-value pairs |

---

##  Syntax for Declaring Variables

### Example: `variables.tf`

```hcl
variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "allowed_ips" {
  description = "List of allowed IPs for security group"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "enable_monitoring" {
  description = "Enable CloudWatch monitoring"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Map of tags to apply"
  type        = map(string)
  default     = {
    environment = "dev"
    owner       = "team-a"
  }
}

variable "db_password" {
  description = "Database password (Sensitive)"
  type        = string
  sensitive   = true
}
```

---

##  Using Variables in Terraform Resources

```hcl
provider "aws" {
  region = var.region
}

resource "aws_instance" "web" {
  ami           = "ami-12345678"
  instance_type = var.instance_type

  tags = merge(var.tags, {
    Name = "MyWebServer"
  })
}
```

---

##  Passing Variables

### 1️ Using `terraform.tfvars`

```hcl
region        = "us-west-2"
instance_type = "t3.medium"
allowed_ips   = ["192.168.1.1/32", "10.0.0.0/16"]
enable_monitoring = false
tags = {
  environment = "production"
  owner       = "team-prod"
}
db_password = "SuperSecret123"
```

### 2️ Using Command-line Arguments

```bash
terraform apply -var="region=us-west-2" -var="instance_type=t3.micro"
```

### 3️ Using Environment Variables

```bash
export TF_VAR_region="us-west-1"
export TF_VAR_instance_type="t3.small"
terraform apply
```

---

##  Sensitive Variables

```hcl
variable "db_password" {
  description = "The database password"
  type        = string
  sensitive   = true
}
```

Sensitive variables will not be shown in `terraform plan` or `terraform apply` outputs.

---

##  Outputting Variable Values

```hcl
output "selected_region" {
  value = var.region
}

output "instance_type_used" {
  value = var.instance_type
}

output "is_monitoring_enabled" {
  value = var.enable_monitoring
}
```

To view outputs:

```bash
terraform output
terraform output selected_region
```

---

##  Best Practices

- Always provide a `description`.
- Use `default` where reasonable to avoid forcing inputs every time.
- Mark sensitive values as `sensitive = true`.
- Organize variables in a dedicated file (e.g., `variables.tf`).
- Use `.tfvars` files for environment-specific configurations (e.g., `prod.tfvars`, `dev.tfvars`).

---

##  Example Project Structure

```
terraform-ec2-example/
├── main.tf
├── variables.tf
├── terraform.tfvars
├── outputs.tf
├── provider.tf
```

---

## Conclusion

Terraform variables help you build scalable and maintainable infrastructure as code by separating configuration from logic. They enable easy customization, promote reusability, and help manage sensitive data securely.

---

##  References

- Official Terraform Documentation: [https://developer.hashicorp.com/terraform/language/values/variables](https://developer.hashicorp.com/terraform/language/values/variables)
