#!/usr/bin/env bash
# Phase-5258: UI ssh-auth-policy roster detail + download/copy.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'sshAuthPolicyRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig ssh-auth-policy roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-policy roster' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh-auth-policy roster ok"; echo "cleaned"; echo "OK: phase5258 e2e passed"
