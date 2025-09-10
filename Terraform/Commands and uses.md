# Terraform Commands and Their Uses

Terraform commands are the CLI interface to manage your infrastructure lifecycle — from writing and validating configuration files to provisioning and destroying infrastructure.

---

## 1. `terraform init`

### What it does:
- Initializes a Terraform working directory.
- Downloads provider plugins (like AWS, Azure, GCP) and modules needed.
- Sets up the backend for state storage (local or remote).

### When to use:
- Run this **once at the beginning** when you start a new Terraform project.
- Run whenever you add a new provider or module to your configuration.
- Run if you change backend configuration.

### Why important:
- Prepares your working environment.
- Ensures all required dependencies are downloaded before Terraform runs.

---

## 2. `terraform validate`

### What it does:
- Checks if your Terraform files are syntactically valid.
- Verifies the configuration is internally consistent.
- Does **not** connect to any cloud provider or create resources.

### When to use:
- Before running `terraform plan` or `terraform apply`.
- To catch errors early in your configuration files.

### Why important:
- Prevents costly or failed applies due to syntax or logical errors.

---

## 3. `terraform fmt`

### What it does:
- Automatically formats your `.tf` files to canonical style.
- Fixes indentation, spacing, alignment to improve readability.

### When to use:
- Before committing code to version control.
- To maintain consistent style across team members.

### Why important:
- Enforces clean, readable, and standardized code style.

---

## 4. `terraform plan`

### What it does:
- Creates an execution plan.
- Shows what actions Terraform will perform (create, update, delete).
- Compares your configuration files to the current state file and real infrastructure.

### When to use:
- Before applying any changes.
- To preview and verify infrastructure modifications.
- In automated CI/CD pipelines to review changes.

### Why important:
- Gives insight into what will happen before making changes.
- Prevents accidental infrastructure destruction or unwanted changes.

---

## 5. `terraform apply`

### What it does:
- Applies the changes required to reach the desired state described in your `.tf` files.
- Provisions, updates, or deletes infrastructure resources.
- Prompts for approval by default (can be skipped with `-auto-approve`).

### When to use:
- After verifying a plan with `terraform plan`.
- To create or update your infrastructure.
- In automation pipelines with `-auto-approve`.

### Why important:
- Executes the actual changes to your infrastructure.
- Central command for provisioning and updating resources.

---

## 6. `terraform show`

### What it does:
- Displays the current state or the plan in a human-readable format.
- Shows detailed information about resources managed by Terraform.

### When to use:
- To inspect the current state file or plan output.
- For debugging and understanding your deployed infrastructure.

### Why important:
- Helps audit and visualize infrastructure state and plans.

---

## 7. `terraform state`

### What it does:
- A set of subcommands to inspect and manipulate the Terraform state file.
- Examples: list resources (`terraform state list`), show resource details (`terraform state show`), remove resources (`terraform state rm`), or move resources (`terraform state mv`).

### When to use:
- To debug state issues.
- To manually fix or adjust the state.
- When importing or removing resources from Terraform management.

### Why important:
- State management is critical for Terraform’s operation.
- Advanced users rely on state commands to maintain consistency.

---

## 8. `terraform refresh`

### What it does:
- Updates the state file with the real-world infrastructure status.
- Detects any drift or changes made outside Terraform.

### When to use:
- To sync Terraform state with actual infrastructure.
- Before planning or applying to avoid unexpected changes.

### Why important:
- Ensures Terraform has an accurate view of resources.

---

## 9. `terraform import`

### What it does:
- Imports existing infrastructure resources into Terraform state.
- Allows Terraform to manage resources created outside of Terraform.

### When to use:
- To bring manually created resources under Terraform management.
- During migration to IaC for legacy infrastructure.

### Why important:
- Enables IaC adoption without recreating resources.

---

## 10. `terraform destroy`

### What it does:
- Destroys all or specified managed infrastructure resources.
- Completely tears down infrastructure provisioned by Terraform.

### When to use:
- When decommissioning environments (e.g., dev/test).
- Cleaning up resources to avoid costs.
- Resetting environments.

### Why important:
- Allows safe and automated teardown of infrastructure.
- Prevents manual errors and ensures complete cleanup.

---

## 11. `terraform output`

### What it does:
- Reads output variables defined in your configuration.
- Displays useful information like IP addresses, DNS names, resource IDs.

### When to use:
- After applying infrastructure to get important connection info.
- In automation pipelines to pass resource info to other tools.

### Why important:
- Facilitates integration and sharing of infrastructure data.

---

## 12. `terraform workspace`

### What it does:
- Manages multiple state instances in a single configuration.
- Allows working with multiple environments (e.g., dev, staging, prod) using isolated states.

### When to use:
- When you want to manage multiple environments from the same codebase.
- To isolate infrastructure states for different projects or teams.

### Why important:
- Helps maintain clean separation of environments and state files.

---

# Summary Table of Common Terraform Commands

| Command            | Purpose                                  | Typical Use Case                      |
|--------------------|------------------------------------------|-------------------------------------|
| `terraform init`    | Initialize working directory and plugins | Start new project or add providers  |
| `terraform validate`| Validate config files                    | Catch syntax/config errors early    |
| `terraform fmt`     | Format config files                      | Enforce code style                  |
| `terraform plan`    | Preview infrastructure changes          | Review changes before applying      |
| `terraform apply`   | Apply infrastructure changes            | Create/update infrastructure        |
| `terraform show`    | Display state or plan                    | Inspect resources                   |
| `terraform state`   | Manage state file                        | Debug or manipulate state           |
| `terraform refresh` | Sync state with real infrastructure     | Detect drift                       |
| `terraform import`  | Import existing resources                | Bring manual resources under IaC    |
| `terraform destroy` | Destroy infrastructure                   | Tear down environments             |
| `terraform output`  | Show output variables                    | Get resource info after apply       |
| `terraform workspace` | Manage multiple states/environments     | Work with dev/staging/prod in one codebase |

---

# Best Practices for Using Terraform Commands

- Always run `terraform validate` before planning or applying.
- Use `terraform plan` to preview changes and avoid surprises.
- Keep state files secure and back them up (use remote backends for teams).
- Use workspaces or separate state files for different environments.
- Automate `terraform fmt` to maintain code quality.
- Use `terraform import` carefully and document imported resources.
- Regularly run `terraform refresh` to detect drift.
- Use version control (Git) for Terraform configuration files.
- Use CI/CD pipelines to automate Terraform workflows and approvals.

---

.
