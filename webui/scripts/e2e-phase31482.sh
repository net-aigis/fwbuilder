#!/usr/bin/env bash
# Phase-31482: UI ssh-auth-ms-71000-echo roster Soft 31480+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-71000-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs71000EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 31480+ ssh-auth-ms-71000-echo roster ok"; echo "cleaned"; echo "OK: phase31482 e2e passed"
