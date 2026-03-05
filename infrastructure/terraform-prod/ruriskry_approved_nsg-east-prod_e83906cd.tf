# =============================================================================
# RuriSkry Governance — Approved Action Stub
# =============================================================================
# Action:       modify_nsg
# Resource:     nsg-east-prod
# Full ID:      /subscriptions/44caae19-24a6-4c48-9f94-b3aa3865a3f7/resourceGroups/ruriskry-prod-rg/providers/Microsoft.Network/networkSecurityGroups/nsg-east-prod
# Proposing Agent: deploy-agent
# SRI Composite: 18.0 / 100
#   Infrastructure: 60.0
#   Policy:         0.0
#   Historical:     0.0
#   Cost:           0.0
# Verdict:      APPROVED
# Reason:       CRITICAL: The rule 'testing-ssh' allows inbound SSH (port 22) from any source ('*'). This exposes management access to the entire internet. Rule details: sourceAddressPrefix='*', destinationPortRange='22', access=Allow.
# Action ID:    e83906cd-c811-4b61-827e-0a0d969573d9
# IaC Tool:     terraform
# IaC Path:     infrastructure/terraform-prod
# Generated:    2026-03-05T10:31:22.954453+00:00
# =============================================================================
#
# REVIEWER INSTRUCTIONS:
# 1. Run `terraform plan` in CI to preview the actual changes.
# 2. Locate the existing resource block for "nsg-east-prod" in this directory.
# 3. Apply the change described below, then DELETE this stub file.
# 4. The governance verdict is logged in Cosmos DB (Action ID above).
# =============================================================================

# CHANGE REQUIRED: NSG modification for nsg-east-prod
# Agent reason: CRITICAL: The rule 'testing-ssh' allows inbound SSH (port 22) from any source ('*'). This exposes management access to the entire internet. Rule details: sourceAddressPrefix='*', destinationPortRange='22', access=Allow.
#
# In the existing azurerm_network_security_group or
# azurerm_network_security_rule block for nsg-east-prod:
# - Add/modify the security rule as described above
# Then delete this file.
