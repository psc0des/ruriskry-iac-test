# =============================================================================
# RuriSkry Governance — Approved Action Stub
# =============================================================================
# Action:       modify_nsg
# Resource:     nsg-east-prod
# Full ID:      /subscriptions/e7e0ed80-af35-4e01-8bec-888bfb46220f/resourceGroups/ruriskry-prod-rg/providers/Microsoft.Network/networkSecurityGroups/nsg-east-prod
# Proposing Agent: deploy-agent
# SRI Composite: 39.5 / 100
#   Infrastructure: 50.0
#   Policy:         30.0
#   Historical:     60.0
#   Cost:           10.0
# Verdict:      APPROVED
# Reason:       CRITICAL: 1 internet-exposed management port rule(s) on NSG 'nsg-east-prod': 'allow-ssh-anywhere' port=22 src=*. Each rule exposes a management port to the open internet (source=*/Any/Internet), creating unauthorized remote access and RCE risk. Remove or restrict these rules immediately.
# Action ID:    6d8eb72e-734e-4a00-b683-e8feef8635a6
# IaC Tool:     terraform
# IaC Path:     infrastructure/terraform-demo
# Generated:    2026-04-12T03:06:44.499841+00:00
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
