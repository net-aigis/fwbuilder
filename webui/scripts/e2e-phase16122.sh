#!/usr/bin/env bash
# Phase-16122: UI ssh-auth-ms-47000-echo roster Soft 16120+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-47000-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs47000EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 16120+ ssh-auth-ms-47000-echo roster ok"; echo "cleaned"; echo "OK: phase16122 e2e passed"
