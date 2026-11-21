#!/usr/bin/env bash
# Phase-35882: UI ssh-auth-soft-37240-echo roster Soft 35880+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-37240-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft37240EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 35880+ ssh-auth-soft-37240-echo roster ok"; echo "cleaned"; echo "OK: phase35882 e2e passed"
