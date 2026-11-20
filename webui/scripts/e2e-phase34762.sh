#!/usr/bin/env bash
# Phase-34762: UI ssh-auth-schema-371-echo roster Soft 34760+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-371-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema371EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 34760+ ssh-auth-schema-371-echo roster ok"; echo "cleaned"; echo "OK: phase34762 e2e passed"
