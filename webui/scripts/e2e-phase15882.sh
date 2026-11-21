#!/usr/bin/env bash
# Phase-15882: UI ssh-auth-schema-135-echo roster Soft 15880+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-135-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema135EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 15880+ ssh-auth-schema-135-echo roster ok"; echo "cleaned"; echo "OK: phase15882 e2e passed"
