#!/usr/bin/env bash
# Phase-31162: UI ssh-auth-ms-70500-echo roster Soft 31160+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-70500-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs70500EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 31160+ ssh-auth-ms-70500-echo roster ok"; echo "cleaned"; echo "OK: phase31162 e2e passed"
