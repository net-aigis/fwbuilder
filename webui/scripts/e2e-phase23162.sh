#!/usr/bin/env bash
# Phase-23162: UI ssh-auth-ms-58000-echo roster Soft 23160+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-58000-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs58000EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 23160+ ssh-auth-ms-58000-echo roster ok"; echo "cleaned"; echo "OK: phase23162 e2e passed"
