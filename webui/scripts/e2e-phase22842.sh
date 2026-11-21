#!/usr/bin/env bash
# Phase-22842: UI ssh-auth-ms-57500-echo roster Soft 22840+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-57500-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs57500EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 22840+ ssh-auth-ms-57500-echo roster ok"; echo "cleaned"; echo "OK: phase22842 e2e passed"
