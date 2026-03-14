# =============================================================================
# RuriSkry Governance — Approved Action Stub
# =============================================================================
# Action:       restart_service
# Resource:     vm-web-01
# Full ID:      /subscriptions/44caae19-24a6-4c48-9f94-b3aa3865a3f7/resourceGroups/ruriskry-prod-rg/providers/Microsoft.Compute/virtualMachines/vm-web-01
# Proposing Agent: monitoring-agent
# SRI Composite: 21.0 / 100
#   Infrastructure: 30.0
#   Policy:         0.0
#   Historical:     40.0
#   Cost:           10.0
# Verdict:      APPROVED
# Reason:       Alert 'alert-vm-web-01-heartbeat' fired at 2026-03-14T12:50:32Z. Evidence: get_resource_details shows powerState='VM deallocated' (instanceView.powerState.displayStatus). VM size: Standard_B2ls_v2. No activity log entries were found in the last 24h for resource group 'ruriskry-prod-rg' (query_activity_log returned empty), so there is no recorded manual stop or failed operation in activity logs. Tags indicate downstream dependencies: payment-api-prod-prod, ruriskryprodprod, nsg-east-prod. Action: restart VM to restore availability.
# Action ID:    bb9dd575-ccd4-426e-a217-1179883ec7fc
# IaC Tool:     terraform
# IaC Path:     infrastructure/terraform-prod
# Generated:    2026-03-14T12:56:16.828474+00:00
# =============================================================================
#
# REVIEWER INSTRUCTIONS:
# 1. Run `terraform plan` in CI to preview the actual changes.
# 2. Locate the existing resource block for "vm-web-01" in this directory.
# 3. Apply the change described below, then DELETE this stub file.
# 4. The governance verdict is logged in Cosmos DB (Action ID above).
# =============================================================================

# CHANGE REQUIRED: Restart service on vm-web-01
# Agent reason: Alert 'alert-vm-web-01-heartbeat' fired at 2026-03-14T12:50:32Z. Evidence: get_resource_details shows powerState='VM deallocated' (instanceView.powerState.displayStatus). VM size: Standard_B2ls_v2. No activity log entries were found in the last 24h for resource group 'ruriskry-prod-rg' (query_activity_log returned empty), so there is no recorded manual stop or failed operation in activity logs. Tags indicate downstream dependencies: payment-api-prod-prod, ruriskryprodprod, nsg-east-prod. Action: restart VM to restore availability.
#
# NOTE: Service restarts are typically not managed via Terraform.
# Consider:
# - Using az vm restart or az webapp restart directly
# - Adding a null_resource with a remote-exec provisioner
# Then delete this file.
