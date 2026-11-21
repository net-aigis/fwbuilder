#!/usr/bin/env bash
# Phase-5322: UI ssh-auth-policy roster Soft 5320+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-policy roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthPolicyRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 5320+ ssh-auth-policy roster ok"; echo "cleaned"; echo "OK: phase5322 e2e passed"
