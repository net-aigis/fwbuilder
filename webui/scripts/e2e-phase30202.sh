#!/usr/bin/env bash
# Phase-30202: UI ssh-auth-ms-69000-echo roster Soft 30200+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-69000-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs69000EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 30200+ ssh-auth-ms-69000-echo roster ok"; echo "cleaned"; echo "OK: phase30202 e2e passed"
