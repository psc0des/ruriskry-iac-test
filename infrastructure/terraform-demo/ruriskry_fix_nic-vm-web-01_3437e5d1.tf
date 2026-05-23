# =============================================================================
# RuriSkry Governance — Approved Action Stub
# =============================================================================
# Action:       update_config
# Resource:     nic-vm-web-01
# Full ID:      /subscriptions/1e052dd5-a21a-4ae0-aeac-49bdd412f3db/resourceGroups/ruriskry-prod-rg/providers/Microsoft.Network/networkInterfaces/nic-vm-web-01
# Proposing Agent: deploy-agent
# SRI Composite: 20.2 / 100
#   Infrastructure: 5.0
#   Policy:         10.0
#   Historical:     65.0
#   Cost:           0.0
# Verdict:      APPROVED
# Reason:       [UNIV-HYG-002] 'nic-vm-web-01' is missing required tags: costcenter, environment, owner. These tags are needed for cost allocation and ownership attribution. Add the missing tags to comply with the tagging policy.
# Action ID:    3437e5d1-ee76-4366-92f0-84e32873f406
# IaC Tool:     terraform
# IaC Path:     infrastructure/terraform-demo
# Generated:    2026-05-23T07:23:30.974950+00:00
# =============================================================================
#
# REVIEWER INSTRUCTIONS:
# 1. Run `terraform plan` in CI to preview the actual changes.
# 2. Locate the existing resource block for "nic-vm-web-01" in this directory.
# 3. Apply the change described below, then DELETE this stub file.
# 4. The governance verdict is logged in Cosmos DB (Action ID above).
# =============================================================================

# CHANGE REQUIRED: Configuration update for nic-vm-web-01
# Agent reason: [UNIV-HYG-002] 'nic-vm-web-01' is missing required tags: costcenter, environment, owner. These tags are needed for cost allocation and ownership attribution. Add the missing tags to comply with the tagging policy.
#
# Apply the configuration change described above to the
# resource block for nic-vm-web-01 in this Terraform directory.
# Then delete this file.
