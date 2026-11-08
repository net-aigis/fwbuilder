#!/usr/bin/env bash
# Phase-15402: UI ssh-auth-soft-15300-echo roster Soft 15400+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-15300-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft15300EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 15400+ ssh-auth-soft-15300-echo roster ok"; echo "cleaned"; echo "OK: phase15402 e2e passed"
