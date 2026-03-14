# =============================================================================
# RuriSkry Governance — Approved Action Stub
# =============================================================================
# Action:       update_config
# Resource:     vm-web-01
# Full ID:      /subscriptions/44caae19-24a6-4c48-9f94-b3aa3865a3f7/resourceGroups/ruriskry-prod-rg/providers/Microsoft.Compute/virtualMachines/vm-web-01
# Proposing Agent: deploy-agent
# SRI Composite: 26.8 / 100
#   Infrastructure: 60.0
#   Policy:         5.0
#   Historical:     30.0
#   Cost:           0.0
# Verdict:      APPROVED
# Reason:       OS disk shows no diskEncryptionSet or encryption settings — OS disk may not be encrypted at rest. Enable platform or customer-managed disk encryption.
# Action ID:    2447a021-2c0f-40c6-911f-b16d00c3a05c
# IaC Tool:     terraform
# IaC Path:     infrastructure/terraform-prod
# Generated:    2026-03-14T14:55:00.505164+00:00
# =============================================================================
#
# REVIEWER INSTRUCTIONS:
# 1. Run `terraform plan` in CI to preview the actual changes.
# 2. Locate the existing resource block for "vm-web-01" in this directory.
# 3. Apply the change described below, then DELETE this stub file.
# 4. The governance verdict is logged in Cosmos DB (Action ID above).
# =============================================================================

# CHANGE REQUIRED: Configuration update for vm-web-01
# Agent reason: OS disk shows no diskEncryptionSet or encryption settings — OS disk may not be encrypted at rest. Enable platform or customer-managed disk encryption.
#
# Apply the configuration change described above to the
# resource block for vm-web-01 in this Terraform directory.
# Then delete this file.
