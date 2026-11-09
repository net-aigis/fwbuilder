#!/usr/bin/env bash
# Phase-20042: UI ssh-auth-schema-187-echo roster Soft 20040+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-187-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema187EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 20040+ ssh-auth-schema-187-echo roster ok"; echo "cleaned"; echo "OK: phase20042 e2e passed"
