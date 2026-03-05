# =============================================================================
# RuriSkry Governance — Approved Action Stub
# =============================================================================
# Action:       modify_nsg
# Resource:     allow-ssh-anywhere
# Full ID:      /subscriptions/44caae19-24a6-4c48-9f94-b3aa3865a3f7/resourceGroups/ruriskry-prod-rg/providers/Microsoft.Network/networkSecurityGroups/nsg-east-prod/securityRules/allow-ssh-anywhere
# Proposing Agent: deploy-agent
# SRI Composite: 10.5 / 100
#   Infrastructure: 35.0
#   Policy:         0.0
#   Historical:     0.0
#   Cost:           0.0
# Verdict:      APPROVED
# Reason:       CRITICAL: Inbound Allow rule 'allow-ssh-anywhere' allows SSH (port 22) from all sources ('*'). This exposes management access to the internet. Immediate remediation required by restricting sourceAddressPrefix.
# Action ID:    4e6bd92a-e627-466f-ad71-fa8c44b33637
# IaC Tool:     
# IaC Path:     
# Generated:    2026-03-05T18:59:24.686350+00:00
# =============================================================================
#
# REVIEWER INSTRUCTIONS:
# 1. Run `terraform plan` in CI to preview the actual changes.
# 2. Locate the existing resource block for "allow-ssh-anywhere" in this directory.
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
# 1. Find the azurerm_network_security_rule resource named "allow-ssh-anywhere"
#    OR the inline security_rule block inside azurerm_network_security_group.
# 2. Delete that resource block (or the inline block).
# 3. Run: terraform plan   ← confirm only that rule is removed
# 4. Merge this PR to apply via CI/CD.
#
# If defined as a standalone resource, it looks like:
#
# resource "azurerm_network_security_rule" "allow_ssh_anywhere" {  ← DELETE THIS BLOCK
#   name  = "allow-ssh-anywhere"
#   ...
# }

# ---------------------------------------------------------------------------
# OPTION B: Restrict source to your specific IP (keeps SSH access for you)
# ---------------------------------------------------------------------------
resource "azurerm_network_security_rule" "allow_ssh_anywhere" {
  name                        = "allow-ssh-anywhere"
  priority                    = 140        # Keep existing priority
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "YOUR_IP_ADDRESS/32"  # ← Replace with your IP
  destination_address_prefix  = "*"
  resource_group_name         = "ruriskry-prod-rg"
  network_security_group_name = "allow-ssh-anywhere"
}

# ---------------------------------------------------------------------------
# OPTION C: Add a higher-priority deny rule to block internet access
#           (keeps the existing rule, blocks it for internet sources)
# ---------------------------------------------------------------------------
resource "azurerm_network_security_rule" "deny_allow_ssh_anywhere_internet" {
  name                        = "deny-allow-ssh-anywhere-internet"
  priority                    = 100        # Higher priority than allow-ssh-anywhere (140)
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
