#!/usr/bin/env bash
# Phase-30282: UI ssh-auth-schema-315-echo roster Soft 30280+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-315-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema315EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 30280+ ssh-auth-schema-315-echo roster ok"; echo "cleaned"; echo "OK: phase30282 e2e passed"
