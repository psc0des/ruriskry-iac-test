# =============================================================================
# RuriSkry Governance — Approved Action Stub
# =============================================================================
# Action:       modify_nsg
# Resource:     nsg-east-prod
# Full ID:      /subscriptions/44caae19-24a6-4c48-9f94-b3aa3865a3f7/resourceGroups/ruriskry-prod-rg/providers/Microsoft.Network/networkSecurityGroups/nsg-east-prod
# Proposing Agent: deploy-agent
# SRI Composite: 29.5 / 100
#   Infrastructure: 40.0
#   Policy:         35.0
#   Historical:     35.0
#   Cost:           0.0
# Verdict:      APPROVED
# Reason:       CRITICAL: 1 internet-exposed management port rule(s) on NSG 'nsg-east-prod': 'allow-ssh-anywhere' port=22 src=*. Each rule exposes a management port to the open internet (source=*/Any/Internet), creating unauthorized remote access and RCE risk. Remove or restrict these rules immediately.
# Action ID:    1c2e158a-2adf-4d92-bea3-61701874b8af
# IaC Tool:     terraform
# IaC Path:     infrastructure/terraform-prod
# Generated:    2026-03-14T17:36:52.722960+00:00
# =============================================================================
#
# REVIEWER INSTRUCTIONS:
# 1. Run `terraform plan` in CI to preview the actual changes.
# 2. Locate the existing resource block for "nsg-east-prod" in this directory.
# 3. Apply the change described below, then DELETE this stub file.
# 4. The governance verdict is logged in Cosmos DB (Action ID above).
# =============================================================================

# ===========================================================================
# REAL TERRAFORM FIX — Add deny rule to block dangerous inbound access
# ===========================================================================
resource "azurerm_network_security_rule" "deny_dangerous_inbound" {
  name                        = "deny-dangerous-inbound"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Deny"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "Internet"
  destination_address_prefix  = "*"
  resource_group_name         = "ruriskry-prod-rg"
  network_security_group_name = "nsg-east-prod"
}
# Agent reason: CRITICAL: 1 internet-exposed management port rule(s) on NSG 'nsg-east-prod': 'allow-ssh-anywhere' port=22 src=*. Each rule exposes a management port to the open internet (source=*/Any/Internet), creating unauthorized remote access and RCE risk. Remove or restrict these rules immediately.
