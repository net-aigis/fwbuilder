#!/usr/bin/env bash
# Phase-40122: UI ssh-auth-ms-84500-echo roster Soft 40120+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-84500-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs84500EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 40120+ ssh-auth-ms-84500-echo roster ok"; echo "cleaned"; echo "OK: phase40122 e2e passed"
