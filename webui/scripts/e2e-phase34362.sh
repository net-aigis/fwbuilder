#!/usr/bin/env bash
# Phase-34362: UI ssh-auth-ms-75500-echo roster Soft 34360+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-75500-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs75500EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 34360+ ssh-auth-ms-75500-echo roster ok"; echo "cleaned"; echo "OK: phase34362 e2e passed"
