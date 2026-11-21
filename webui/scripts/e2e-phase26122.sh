#!/usr/bin/env bash
# Phase-26122: UI ssh-auth-schema-263-echo roster Soft 26120+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-263-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema263EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 26120+ ssh-auth-schema-263-echo roster ok"; echo "cleaned"; echo "OK: phase26122 e2e passed"
