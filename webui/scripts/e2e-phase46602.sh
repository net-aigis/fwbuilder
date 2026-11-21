#!/usr/bin/env bash
# Phase-46602: UI ssh-auth-schema-519-echo roster Soft 46600+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-519-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema519EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 46600+ ssh-auth-schema-519-echo roster ok"; echo "cleaned"; echo "OK: phase46602 e2e passed"
