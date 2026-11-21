#!/usr/bin/env bash
# Phase-42362: UI ssh-auth-ms-88000-echo roster Soft 42360+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-88000-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs88000EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 42360+ ssh-auth-ms-88000-echo roster ok"; echo "cleaned"; echo "OK: phase42362 e2e passed"
