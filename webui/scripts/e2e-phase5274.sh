#!/usr/bin/env bash
# Phase-5274: UI honesty bundle includes ssh_auth_policy_roster section.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'ssh_auth_policy_roster:' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'soft_fertig_ssh_auth_policy_roster:' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh_auth_policy_roster bundle section ok"; echo "cleaned"; echo "OK: phase5274 e2e passed"
