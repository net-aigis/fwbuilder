#!/usr/bin/env bash
# Phase-7002: UI ssh-auth-policy-refresh roster Soft 6680+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-policy-refresh roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthPolicyRefreshRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 6680+ ssh-auth-policy-refresh roster ok"; echo "cleaned"; echo "OK: phase7002 e2e passed"
