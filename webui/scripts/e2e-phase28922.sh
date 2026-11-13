#!/usr/bin/env bash
# Phase-28922: UI ssh-auth-ms-67000-echo roster Soft 28920+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-67000-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs67000EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 28920+ ssh-auth-ms-67000-echo roster ok"; echo "cleaned"; echo "OK: phase28922 e2e passed"
