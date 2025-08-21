## Assumptions

- Region: `australiaeast`
- VM size: `Standard_B1ls` (1 vCPU, 0.5 GiB) — chosen to keep cost low.
- OS disk: 30 GiB Standard HDD per VM.
- Basic Azure Load Balancer (public) with one rule + HTTP probe.
- Light traffic and negligible egress.

## Estimated monthly cost (≈ AUD)

| Component                              | Qty | Unit est. (AUD) | Subtotal |
|----------------------------------------|----:|-----------------:|---------:|
| 2× Standard_B1ls VMs                   |  2 | ~$5–6           | ~$10–12  |
| 30 GiB Standard HDD (OS disk)          |  2 | ~$1–2           | ~$2–4    |
| Public IP (basic) + Basic LB           |  1 | ~$0–1           | ~$0–1    |
| Misc (small egress/metrics, buffer)    |  – | –               | ~$2–3    |
| **Estimated total**                    |    |                 | **~$14–20** |

ø# Auto-healing Web Tier (Azure + Terraform)

## Choice
**Azure + Terraform** was chosen to keep costs low (Basic Load Balancer + small VM size) and meet **IaC only** and **self-healing** requirements.

## What this creates (plan-only)
- Resource Group, VNet/Subnet, NSG (HTTP/80 + SSH/22)
- Public IP + **Azure Load Balancer** (HTTP probe + rule)
- VM Scale Set (Ubuntu 22.04, 2 instances, NGINX via cloud-init)
- **Auto-healing** via VMSS health probe + automatic instance repair

## Architecture
![Auto-healing web tier on Azure](./g360-autohealing-webtier.drawio.png)

## How to run (plan only)
```bash
terraform fmt -recursive
terraform init
terraform validate
terraform plan -out plan.tfplan
terraform show -no-color plan.tfplan > plan.txt
# Auto-healing Web Tier (Azure + Terraform)

## Choice
**Azure + Terraform** to keep costs low (Basic Load Balancer + small VM size) and meet “IaC only” and “self-healing” requirements.

## What this creates (plan-only)
- Resource Group, VNet/Subnet, NSG (HTTP/80 + SSH/22)
- Public IP + **Azure Load Balancer** (HTTP probe + rule)
- **VM Scale Set** (Ubuntu 22.04, 2 instances, NGINX via cloud-init)
- **Auto-heal** via VMSS health probe + automatic instance repair

## How to run (plan only)
```bash
terraform fmt -recursive
terraform init
terraform validate
terraform plan -out plan.tfplan
terraform show -no-color plan.tfplan > plan.txt

