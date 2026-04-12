# =============================================================================
# RuriSkry Governance — Approved Action Stub
# =============================================================================
# Action:       update_config
# Resource:     asp-ruriskry-prod-demo
# Full ID:      /subscriptions/e7e0ed80-af35-4e01-8bec-888bfb46220f/resourceGroups/ruriskry-prod-rg/providers/Microsoft.Web/serverfarms/asp-ruriskry-prod-demo
# Proposing Agent: monitoring-agent
# SRI Composite: 11.0 / 100
#   Infrastructure: 5.0
#   Policy:         10.0
#   Historical:     20.0
#   Cost:           10.0
# Verdict:      APPROVED
# Reason:       App Service Plan asp-ruriskry-prod-demo has only 1 instance in production environment, scale out recommended for reliability
# Action ID:    0f63e160-e457-4391-ab89-952c7f41edb5
# IaC Tool:     terraform
# IaC Path:     infrastructure/terraform-demo
# Generated:    2026-04-12T05:25:12.943093+00:00
# =============================================================================
#
# REVIEWER INSTRUCTIONS:
# 1. Run `terraform plan` in CI to preview the actual changes.
# 2. Locate the existing resource block for "asp-ruriskry-prod-demo" in this directory.
# 3. Apply the change described below, then DELETE this stub file.
# 4. The governance verdict is logged in Cosmos DB (Action ID above).
# =============================================================================

# CHANGE REQUIRED: Configuration update for asp-ruriskry-prod-demo
# Agent reason: App Service Plan asp-ruriskry-prod-demo has only 1 instance in production environment, scale out recommended for reliability
#
# Apply the configuration change described above to the
# resource block for asp-ruriskry-prod-demo in this Terraform directory.
# Then delete this file.
