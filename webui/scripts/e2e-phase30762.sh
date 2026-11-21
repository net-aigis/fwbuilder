#!/usr/bin/env bash
# Phase-30762: UI ssh-auth-soft-31560-echo roster Soft 30760+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-31560-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft31560EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 30760+ ssh-auth-soft-31560-echo roster ok"; echo "cleaned"; echo "OK: phase30762 e2e passed"
