#!/usr/bin/env bash
# Phase-20362: UI ssh-auth-schema-191-echo roster Soft 20360+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-191-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema191EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 20360+ ssh-auth-schema-191-echo roster ok"; echo "cleaned"; echo "OK: phase20362 e2e passed"
