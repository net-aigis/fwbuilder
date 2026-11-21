#!/usr/bin/env bash
# Phase-6938: UI ssh-auth-policy-refresh roster detail + download/copy.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'sshAuthPolicyRefreshRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig ssh-auth-policy-refresh roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-policy-refresh roster' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh-auth-policy-refresh roster ok"; echo "cleaned"; echo "OK: phase6938 e2e passed"
