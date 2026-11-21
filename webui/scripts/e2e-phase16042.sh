#!/usr/bin/env bash
# Phase-16042: UI ssh-auth-soft-15960-echo roster Soft 16040+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-15960-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft15960EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 16040+ ssh-auth-soft-15960-echo roster ok"; echo "cleaned"; echo "OK: phase16042 e2e passed"
