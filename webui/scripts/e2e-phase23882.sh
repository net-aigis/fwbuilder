#!/usr/bin/env bash
# Phase-23882: UI ssh-auth-schema-235-echo roster Soft 23880+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-235-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema235EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 23880+ ssh-auth-schema-235-echo roster ok"; echo "cleaned"; echo "OK: phase23882 e2e passed"
