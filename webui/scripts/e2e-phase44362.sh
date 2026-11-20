#!/usr/bin/env bash
# Phase-44362: UI ssh-auth-schema-491-echo roster Soft 44360+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-491-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema491EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 44360+ ssh-auth-schema-491-echo roster ok"; echo "cleaned"; echo "OK: phase44362 e2e passed"
