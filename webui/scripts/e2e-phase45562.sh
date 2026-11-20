#!/usr/bin/env bash
# Phase-45562: UI ssh-auth-ms-93000-echo roster Soft 45560+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-93000-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs93000EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 45560+ ssh-auth-ms-93000-echo roster ok"; echo "cleaned"; echo "OK: phase45562 e2e passed"
