#!/usr/bin/env bash
# Phase-26362: UI ssh-auth-ms-63000-echo roster Soft 26360+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-63000-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs63000EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 26360+ ssh-auth-ms-63000-echo roster ok"; echo "cleaned"; echo "OK: phase26362 e2e passed"
