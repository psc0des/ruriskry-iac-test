# =============================================================================
# RuriSkry Governance — Approved Action Stub
# =============================================================================
# Action:       update_config
# Resource:     vm-dr-01
# Full ID:      /subscriptions/44caae19-24a6-4c48-9f94-b3aa3865a3f7/resourceGroups/ruriskry-prod-rg/providers/Microsoft.Compute/virtualMachines/vm-dr-01
# Proposing Agent: deploy-agent
# SRI Composite: 15.8 / 100
#   Infrastructure: 5.0
#   Policy:         5.0
#   Historical:     40.0
#   Cost:           15.0
# Verdict:      APPROVED
# Reason:       VM OS disk appears unencrypted (no disk encryption extension or encryption settings present). Encrypt OS disk at rest to protect data if disk is stolen or detached.
# Action ID:    b13f4a46-2260-4983-8217-35a953bc0e0d
# IaC Tool:     terraform
# IaC Path:     infrastructure/terraform-prod
# Generated:    2026-03-15T07:24:24.391895+00:00
# =============================================================================
#
# REVIEWER INSTRUCTIONS:
# 1. Run `terraform plan` in CI to preview the actual changes.
# 2. Locate the existing resource block for "vm-dr-01" in this directory.
# 3. Apply the change described below, then DELETE this stub file.
# 4. The governance verdict is logged in Cosmos DB (Action ID above).
# =============================================================================

# CHANGE REQUIRED: Configuration update for vm-dr-01
# Agent reason: VM OS disk appears unencrypted (no disk encryption extension or encryption settings present). Encrypt OS disk at rest to protect data if disk is stolen or detached.
#
# Apply the configuration change described above to the
# resource block for vm-dr-01 in this Terraform directory.
# Then delete this file.
