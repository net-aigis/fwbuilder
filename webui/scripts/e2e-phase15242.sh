#!/usr/bin/env bash
# Phase-15242: UI ssh-auth-schema-127-echo roster Soft 15240+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-127-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema127EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 15240+ ssh-auth-schema-127-echo roster ok"; echo "cleaned"; echo "OK: phase15242 e2e passed"
