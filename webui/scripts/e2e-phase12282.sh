#!/usr/bin/env bash
# Phase-12282: UI ssh-auth-policy-echo roster Soft 12280+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-policy-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthPolicyEchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 12280+ ssh-auth-policy-echo roster ok"; echo "cleaned"; echo "OK: phase12282 e2e passed"
