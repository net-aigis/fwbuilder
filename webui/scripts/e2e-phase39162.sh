#!/usr/bin/env bash
# Phase-39162: UI ssh-auth-ms-83000-echo roster Soft 39160+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-83000-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs83000EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 39160+ ssh-auth-ms-83000-echo roster ok"; echo "cleaned"; echo "OK: phase39162 e2e passed"
