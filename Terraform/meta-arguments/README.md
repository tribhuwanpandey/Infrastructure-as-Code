# Terraform Meta-Arguments

Terraform **meta-arguments** are special arguments that change how resources, modules, or providers behave. They are interpreted directly by Terraform, not the provider.

---

##  Common Meta-Arguments

### 1. `depends_on`
Ensures a resource waits for another before being created.
```hcl
resource "aws_instance" "example" {
  ami           = "ami-123456"
  instance_type = "t2.micro"
  depends_on    = [aws_vpc.main]
}
```

---

### 2. `count`
Creates multiple instances of a resource.
```hcl
resource "aws_instance" "example" {
  ami           = "ami-123456"
  instance_type = "t2.micro"
  count         = 3
}
```

---

### 3. `for_each`
Iterates over a set or map to create multiple resources.
```hcl
resource "aws_instance" "example" {
  for_each = toset(["dev", "stage", "prod"])
  ami      = "ami-123456"
  instance_type = "t2.micro"

  tags = {
    Name = each.key
  }
}
```

---

### 4. `provider`
Specifies which provider configuration to use.
```hcl
resource "aws_instance" "example" {
  provider      = aws.us_east
  ami           = "ami-123456"
  instance_type = "t2.micro"
}
```

---

### 5. `lifecycle`
Controls how Terraform manages resource changes.
```hcl
resource "aws_instance" "example" {
  ami           = "ami-123456"
  instance_type = "t2.micro"

  lifecycle {
    prevent_destroy       = true
    ignore_changes        = [ami]
    create_before_destroy = true
  }
}
```

---

### 6. `provisioner`
Executes local or remote commands after resource creation.
```hcl
resource "aws_instance" "example" {
  ami           = "ami-123456"
  instance_type = "t2.micro"

  provisioner "local-exec" {
    command = "echo Hello from Terraform"
  }
}
```

---

##  Summary

| Meta-Argument  | Purpose |
|----------------|---------|
| `depends_on`   | Define explicit dependency |
| `count`        | Create multiple identical resources |
| `for_each`     | Create multiple resources from map/set |
| `provider`     | Select specific provider configuration |
| `lifecycle`    | Control creation, update, deletion behavior |
| `provisioner`  | Run scripts/commands (not recommended in production) |

---

##  References
- [Terraform Docs - Meta-Arguments](https://developer.hashicorp.com/terraform/language/meta-arguments)
