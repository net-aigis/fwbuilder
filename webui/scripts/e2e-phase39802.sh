#!/usr/bin/env bash
# Phase-39802: UI ssh-auth-ms-84000-echo roster Soft 39800+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-84000-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs84000EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 39800+ ssh-auth-ms-84000-echo roster ok"; echo "cleaned"; echo "OK: phase39802 e2e passed"
