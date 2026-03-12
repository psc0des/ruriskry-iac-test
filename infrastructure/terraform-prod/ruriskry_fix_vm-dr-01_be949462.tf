# =============================================================================
# RuriSkry Governance — Approved Action Stub
# =============================================================================
# Action:       restart_service
# Resource:     vm-dr-01
# Full ID:      /subscriptions/44caae19-24a6-4c48-9f94-b3aa3865a3f7/resourceGroups/ruriskry-prod-rg/providers/Microsoft.Compute/virtualMachines/vm-dr-01
# Proposing Agent: monitoring-agent
# SRI Composite: 15.5 / 100
#   Infrastructure: 10.0
#   Policy:         0.0
#   Historical:     50.0
#   Cost:           0.0
# Verdict:      APPROVED
# Reason:       Azure Monitor heartbeat/availability alert confirmed: the VM 'vm-dr-01' is deallocated (PowerState = deallocated). No heartbeats or metrics are available, which confirms the VM is down. This is a production, disaster-recovery VM. Immediate restart recommended unless stop/deallocate was intentional. Activity log review was unavailable due to a system error, but platform status confirms deallocation. Remediation aligned with DR and production availability requirements.
# Action ID:    be949462-8e5d-4d5f-a3f9-c50828c04d52
# IaC Tool:     terraform
# IaC Path:     infrastructure/terraform-prod
# Generated:    2026-03-12T09:16:53.913617+00:00
# =============================================================================
#
# REVIEWER INSTRUCTIONS:
# 1. Run `terraform plan` in CI to preview the actual changes.
# 2. Locate the existing resource block for "vm-dr-01" in this directory.
# 3. Apply the change described below, then DELETE this stub file.
# 4. The governance verdict is logged in Cosmos DB (Action ID above).
# =============================================================================

# CHANGE REQUIRED: Restart service on vm-dr-01
# Agent reason: Azure Monitor heartbeat/availability alert confirmed: the VM 'vm-dr-01' is deallocated (PowerState = deallocated). No heartbeats or metrics are available, which confirms the VM is down. This is a production, disaster-recovery VM. Immediate restart recommended unless stop/deallocate was intentional. Activity log review was unavailable due to a system error, but platform status confirms deallocation. Remediation aligned with DR and production availability requirements.
#
# NOTE: Service restarts are typically not managed via Terraform.
# Consider:
# - Using az vm restart or az webapp restart directly
# - Adding a null_resource with a remote-exec provisioner
# Then delete this file.
