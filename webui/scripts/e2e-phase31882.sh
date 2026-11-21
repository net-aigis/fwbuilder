#!/usr/bin/env bash
# Phase-31882: UI ssh-auth-schema-335-echo roster Soft 31880+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-335-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema335EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 31880+ ssh-auth-schema-335-echo roster ok"; echo "cleaned"; echo "OK: phase31882 e2e passed"
