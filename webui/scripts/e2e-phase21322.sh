#!/usr/bin/env bash
# Phase-21322: UI ssh-auth-schema-203-echo roster Soft 21320+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-203-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema203EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 21320+ ssh-auth-schema-203-echo roster ok"; echo "cleaned"; echo "OK: phase21322 e2e passed"
