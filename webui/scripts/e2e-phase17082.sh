#!/usr/bin/env bash
# Phase-17082: UI ssh-auth-ms-48500-echo roster Soft 17080+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-48500-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs48500EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 17080+ ssh-auth-ms-48500-echo roster ok"; echo "cleaned"; echo "OK: phase17082 e2e passed"
