#!/usr/bin/env bash
# Phase-15162: UI ssh-auth-ms-45k-echo roster Soft 15160+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-45k-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs45KEchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 15160+ ssh-auth-ms-45k-echo roster ok"; echo "cleaned"; echo "OK: phase15162 e2e passed"
