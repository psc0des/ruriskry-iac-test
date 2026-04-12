# =============================================================================
# RuriSkry Governance — Approved Action Stub
# =============================================================================
# Action:       modify_nsg
# Resource:     allow-ssh-anywhere
# Full ID:      /subscriptions/e7e0ed80-af35-4e01-8bec-888bfb46220f/resourceGroups/ruriskry-prod-rg/providers/Microsoft.Network/networkSecurityGroups/nsg-east-prod/securityRules/allow-ssh-anywhere
# Proposing Agent: deploy-agent
# SRI Composite: 20.2 / 100
#   Infrastructure: 15.0
#   Policy:         25.0
#   Historical:     30.0
#   Cost:           10.0
# Verdict:      APPROVED
# Reason:       allow-ssh-anywhere rule in nsg-east-prod allows SSH (port 22) access from any source, exposing critical management port to internet.
# Action ID:    f8b14b5c-94b8-4f71-94e1-093459461b55
# IaC Tool:     terraform
# IaC Path:     infrastructure/terraform-demo
# Generated:    2026-04-12T02:45:57.483935+00:00
# =============================================================================
#
# REVIEWER INSTRUCTIONS:
# 1. Run `terraform plan` in CI to preview the actual changes.
# 2. Locate the existing resource block for "allow-ssh-anywhere" in this directory.
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
  destination_port_range      = "22"
  source_address_prefix       = "Internet"
  destination_address_prefix  = "*"
  resource_group_name         = "ruriskry-prod-rg"
  network_security_group_name = "allow-ssh-anywhere"
}
# Agent reason: allow-ssh-anywhere rule in nsg-east-prod allows SSH (port 22) access from any source, exposing critical management port to internet.
