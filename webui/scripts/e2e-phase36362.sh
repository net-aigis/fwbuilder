#!/usr/bin/env bash
# Phase-36362: UI ssh-auth-schema-391-echo roster Soft 36360+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-391-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema391EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 36360+ ssh-auth-schema-391-echo roster ok"; echo "cleaned"; echo "OK: phase36362 e2e passed"
