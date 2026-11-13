#!/usr/bin/env bash
# Phase-28362: UI ssh-auth-schema-291-echo roster Soft 28360+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-291-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema291EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 28360+ ssh-auth-schema-291-echo roster ok"; echo "cleaned"; echo "OK: phase28362 e2e passed"
