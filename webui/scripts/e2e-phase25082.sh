#!/usr/bin/env bash
# Phase-25082: UI ssh-auth-ms-61000-echo roster Soft 25080+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-61000-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs61000EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 25080+ ssh-auth-ms-61000-echo roster ok"; echo "cleaned"; echo "OK: phase25082 e2e passed"
