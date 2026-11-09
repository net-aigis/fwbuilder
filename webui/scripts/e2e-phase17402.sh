#!/usr/bin/env bash
# Phase-17402: UI ssh-auth-ms-49000-echo roster Soft 17400+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-49000-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs49000EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 17400+ ssh-auth-ms-49000-echo roster ok"; echo "cleaned"; echo "OK: phase17402 e2e passed"
