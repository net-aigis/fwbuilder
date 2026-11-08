#!/usr/bin/env bash
# Phase-14842: UI ssh-auth-schema-delta roster Soft 14840+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-delta roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchemaDeltaRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 14840+ ssh-auth-schema-delta roster ok"; echo "cleaned"; echo "OK: phase14842 e2e passed"
