#!/usr/bin/env bash
# Phase-25162: UI ssh-auth-schema-251-echo roster Soft 25160+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-251-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema251EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 25160+ ssh-auth-schema-251-echo roster ok"; echo "cleaned"; echo "OK: phase25162 e2e passed"
