# =============================================================================
# RuriSkry Governance — Approved Action Stub
# =============================================================================
# Action:       modify_nsg
# Resource:     ssh
# Full ID:      /subscriptions/44caae19-24a6-4c48-9f94-b3aa3865a3f7/resourceGroups/ruriskry-prod-rg/providers/Microsoft.Network/networkSecurityGroups/nsg-east-prod/securityRules/ssh
# Proposing Agent: deploy-agent
# SRI Composite: 25.2 / 100
#   Infrastructure: 5.0
#   Policy:         55.0
#   Historical:     40.0
#   Cost:           0.0
# Verdict:      APPROVED
# Reason:       Inbound Allow rule 'ssh' allows all sources (*) to access port 22 (SSH). This exposes SSH to the entire internet, which is a critical security risk.
# Action ID:    13f7bfb2-6737-4e71-8c84-fc21437f1736
# IaC Tool:     terraform
# IaC Path:     infrastructure/terraform-prod
# Generated:    2026-03-11T10:35:49.496407+00:00
# =============================================================================
#
# REVIEWER INSTRUCTIONS:
# 1. Run `terraform plan` in CI to preview the actual changes.
# 2. Locate the existing resource block for "ssh" in this directory.
# 3. Apply the change described below, then DELETE this stub file.
# 4. The governance verdict is logged in Cosmos DB (Action ID above).
# =============================================================================

# ===========================================================================
# REAL TERRAFORM FIX — Choose ONE option below, then delete the others.
# After applying, run: terraform plan → verify → terraform apply
# ===========================================================================

# ---------------------------------------------------------------------------
# OPTION A (Recommended): Remove the insecure rule entirely
# ---------------------------------------------------------------------------
# 1. Find the azurerm_network_security_rule resource named "ssh"
#    OR the inline security_rule block inside azurerm_network_security_group.
# 2. Delete that resource block (or the inline block).
# 3. Run: terraform plan   ← confirm only that rule is removed
# 4. Merge this PR to apply via CI/CD.
#
# If defined as a standalone resource, it looks like:
#
# resource "azurerm_network_security_rule" "ssh" {  ← DELETE THIS BLOCK
#   name  = "ssh"
#   ...
# }

# ---------------------------------------------------------------------------
# OPTION B: Restrict source to your specific IP (keeps SSH access for you)
# ---------------------------------------------------------------------------
resource "azurerm_network_security_rule" "ssh" {
  name                        = "ssh"
  priority                    = 140        # Keep existing priority
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "YOUR_IP_ADDRESS/32"  # ← Replace with your IP
  destination_address_prefix  = "*"
  resource_group_name         = "ruriskry-prod-rg"
  network_security_group_name = "ssh"
}

# ---------------------------------------------------------------------------
# OPTION C: Add a higher-priority deny rule to block internet access
#           (keeps the existing rule, blocks it for internet sources)
# ---------------------------------------------------------------------------
resource "azurerm_network_security_rule" "deny_ssh_internet" {
  name                        = "deny-ssh-internet"
  priority                    = 100        # Higher priority than ssh (140)
  direction                   = "Inbound"
  access                      = "Deny"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "Internet"
  destination_address_prefix  = "*"
  resource_group_name         = "ruriskry-prod-rg"
  network_security_group_name = "ssh"
}
