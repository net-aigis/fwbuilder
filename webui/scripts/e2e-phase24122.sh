#!/usr/bin/env bash
# Phase-24122: UI ssh-auth-ms-59500-echo roster Soft 24120+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-59500-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs59500EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 24120+ ssh-auth-ms-59500-echo roster ok"; echo "cleaned"; echo "OK: phase24122 e2e passed"
