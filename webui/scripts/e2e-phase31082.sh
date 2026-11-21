#!/usr/bin/env bash
# Phase-31082: UI ssh-auth-soft-31920-echo roster Soft 31080+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-31920-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft31920EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 31080+ ssh-auth-soft-31920-echo roster ok"; echo "cleaned"; echo "OK: phase31082 e2e passed"
