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
# Reason:       Inbound Allow rule ('testing-ssh-port') allows SSH (port 22) from ANY source ('*'). This exposes management access to the internet. Rule: testing-ssh-port, Source: *, Port: 22. Critical security exposure.
# Action ID:    150a4593-0f95-4954-ac1b-d02456df3b5d
# IaC Tool:     terraform
# IaC Path:     infrastructure/terraform-prod
# Generated:    2026-03-06T06:16:55.053130+00:00
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
  destination_port_range      = "22"
  source_address_prefix       = "Internet"
  destination_address_prefix  = "*"
  resource_group_name         = "ruriskry-prod-rg"
  network_security_group_name = "nsg-east-prod"
}
# Agent reason: Inbound Allow rule ('testing-ssh-port') allows SSH (port 22) from ANY source ('*'). This exposes management access to the internet. Rule: testing-ssh-port, Source: *, Port: 22. Critical security exposure.
