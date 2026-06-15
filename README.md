# AzureKS — Azure Infrastructure with Terraform

Terraform modules and service configurations for provisioning a complete Azure environment, including networking, compute, Kubernetes (AKS), storage, databases, and security components.

---

## Architecture

```
ResourceGroup
    └── VirtualNetwork
            ├── Subnet
            │     ├── NSG (Network Security Group)
            │     └── NetworkInterface
            │             └── VirtualMachine (Ubuntu 22.04 LTS)
            │
            └── ApplicationGateway (Layer 7 Load Balancer)
                        └── PublicIP

AKS / Kube      (Managed Kubernetes Cluster)
Storage         (General-purpose Storage Account)
BlobStorage     (Blob Storage Account + Container)
AzureSQL        (SQL Server + Database)
CosmosDB        (NoSQL Database Account)
KeyVault        (Secrets & Certificate Management)
```

---

## Project Structure

```
AzureKS/
├── Modules/                  # Reusable Terraform resource modules
│   ├── AKS/                  # Azure Kubernetes Service
│   ├── ApplicationGateway/   # Layer 7 load balancer
│   ├── AzureSQL/             # SQL Server + Database
│   ├── BlobStorage/          # Blob Storage Account + Container
│   ├── CosmosDB/             # Cosmos DB Account
│   ├── KeyVault/             # Secrets management
│   ├── kube/                 # AKS (with DNS prefix + identity variables)
│   ├── NetworkInterface/     # Virtual NICs
│   ├── NSG/                  # Network Security Groups
│   ├── PublicIP/             # Public IP addresses
│   ├── ResourceGroup/        # Azure Resource Group
│   ├── Storage/              # General-purpose storage accounts
│   ├── Subnet/               # VNet subnets
│   ├── VirtualMachine/       # Linux VMs
│   └── VirtualNetwork/       # Virtual Networks
│
└── Services/                 # Deployment configurations consuming the modules
    ├── AKS/
    ├── ApplicationGateway/
    ├── AzureSQL/
    ├── BlobStorage/
    ├── CosmosDB/
    ├── KeyVault/
    ├── Kube/
    ├── NetworkInterface/
    ├── NSG/
    ├── PublicIP/
    ├── ResourceGroup/
    ├── Storage/
    ├── Subnet/
    ├── VirtualMachine/
    └── VirtualNetwork/
```

Each module follows a consistent 4-file structure:

| File | Purpose |
|------|---------|
| `resources.tf` | Azure resource definitions |
| `variables.tf` | Input variable declarations |
| `outputs.tf` | Exported output values |
| `versions.tf` | Provider version constraints |

Each Service folder adds:

| File | Purpose |
|------|---------|
| `main.tf` | Module instantiation with provider block |
| `variables.tf` | Variable pass-through declarations |
| `outputs.tf` | Exposed outputs from the module |
| `demo.auto.tfvars.json` | Example configuration values |

---

## Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/downloads) >= 1.0
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli) >= 2.40
- An active Azure subscription

---

## Getting Started

### 1. Authenticate with Azure

```bash
az login
az account set --subscription "<your-subscription-id>"
```

### 2. Configure demo values

Each `Services/<module>/demo.auto.tfvars.json` contains placeholder values. Before deploying, replace all `<...>` placeholders with real values:

| Placeholder | Where | What to put |
|------------|-------|-------------|
| `<your-azure-tenant-id>` | `Services/KeyVault/` | Output of `az account show --query tenantId` |
| `<your-subnet-resource-id>` | `Services/NetworkInterface/`, `Services/ApplicationGateway/` | Full ARM resource ID of your subnet |
| `<your-public-ip-resource-id>` | `Services/ApplicationGateway/` | Full ARM resource ID of your Public IP |
| `<your-nic-resource-id>` | `Services/VirtualMachine/` | Full ARM resource ID of your NIC |
| `<use-a-secure-password-or-reference-key-vault>` | `Services/VirtualMachine/`, `Services/AzureSQL/` | A strong password — never commit real values |

> **Security note:** Never commit real credentials, subscription IDs, or passwords to source control. Use Azure Key Vault or environment variables for secrets in production.

### 3. Deploy a service

Each service is deployed independently. Navigate to the service directory and run standard Terraform commands:

```bash
cd Services/ResourceGroup
terraform init
terraform plan
terraform apply
```

Repeat for each service in dependency order (see below).

---

## Deployment Order

Resources must be deployed in this sequence because later resources depend on earlier ones:

```
1.  ResourceGroup          (required by all other resources)
2.  VirtualNetwork
3.  Subnet
4.  NSG
5.  PublicIP
6.  NetworkInterface
7.  Storage
8.  BlobStorage
9.  KeyVault
10. AzureSQL
11. CosmosDB
12. VirtualMachine
13. ApplicationGateway
14. AKS  (or Kube)
```

---

## Modules Reference

### ResourceGroup
Creates an Azure Resource Group to contain all other resources.

**Key variables:** `rg_name`, `rg_location`

---

### VirtualNetwork
Creates a Virtual Network with a configurable address space.

**Key variables:** `name`, `location`, `rgname`, `address_space`

---

### Subnet
Creates a subnet within a Virtual Network.

**Key variables:** `name`, `rgname`, `virtual_network_name`, `address_prefixes`

---

### NSG
Creates a Network Security Group with a configurable inbound/outbound rule.

**Key variables:** `name`, `location`, `rgname`, `security_rule` (name, priority, direction, access, protocol, ports)

---

### PublicIP
Creates a static or dynamic public IP address.

**Key variables:** `name`, `location`, `rgname`, `allocation_method`, `sku`

---

### NetworkInterface
Creates a virtual NIC with one or more IP configurations.

**Key variables:** `name`, `location`, `rgname`, `ip_configuration` (list of objects)

---

### VirtualMachine
Creates a Linux virtual machine (Ubuntu 22.04 LTS) attached to a NIC.

**Key variables:** `name`, `rgname`, `location`, `vm_size`, `network_interface_ids`, `username`, `password`

---

### Storage
Creates a general-purpose Azure Storage Account.

**Key variables:** `name`, `rg_name`, `location`, `account_tier`, `account_replication_type`

---

### BlobStorage
Creates a Blob-optimized Storage Account plus a storage container.

**Key variables:** `name`, `rgname`, `location`, `account_tier`, `account_replication_type`, `access_tier` (Hot/Cool), `container_name`, `container_access_type`

**Outputs:** `storage_account_id`, `storage_account_name`, `primary_blob_endpoint`, `container_id`, `container_name`

---

### AzureSQL
Creates an Azure SQL Server and a database on that server.

**Key variables:** `server_name`, `rgname`, `location`, `server_version` (12.0), `admin_login`, `admin_password`, `db_name`, `sku_name` (Basic / S0 / GP_Gen5_2)

**Outputs:** `server_id`, `server_name`, `server_fqdn`, `database_id`, `database_name`

---

### CosmosDB
Creates an Azure Cosmos DB account with configurable API kind and consistency level.

**Key variables:** `name`, `rgname`, `location`, `offer_type` (Standard), `kind` (GlobalDocumentDB / MongoDB), `consistency_level` (Session / Eventual / Strong / BoundedStaleness / ConsistentPrefix)

**Outputs:** `id`, `name`, `endpoint`, `primary_key` (sensitive), `connection_strings` (sensitive)

---

### KeyVault
Creates an Azure Key Vault for secrets and certificate management.

**Key variables:** `name`, `rgname`, `location`, `sku_name`, `tenant_id`

---

### ApplicationGateway
Creates a Layer 7 Application Gateway with routing rules.

**Key variables:** `name`, `rgname`, `location`, `sku_name`, `sku_tier`, `sku_capacity`, `subnet_id`, `public_ip_address_id`, backend pool, HTTP settings, listener, and routing rule variables.

---

### AKS / kube
Creates a managed Azure Kubernetes Service cluster.

**Key variables:** `aks_name`, `location`, `rgname`, `default_node_pool` (name, node_count, vm_size), `dns_prefix` (kube only), `identity` (kube only)

---

## Provider Configuration

All modules use the `hashicorp/azurerm` provider pinned at version `3.0.0`:

```hcl
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}
```

---

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/my-change`)
3. Make changes and run `terraform fmt` and `terraform validate` in affected modules/services
4. Open a pull request with a description of the change
