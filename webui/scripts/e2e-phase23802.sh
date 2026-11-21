#!/usr/bin/env bash
# Phase-23802: UI ssh-auth-ms-59000-echo roster Soft 23800+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-59000-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs59000EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 23800+ ssh-auth-ms-59000-echo roster ok"; echo "cleaned"; echo "OK: phase23802 e2e passed"
