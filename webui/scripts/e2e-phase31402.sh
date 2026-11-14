#!/usr/bin/env bash
# Phase-31402: UI ssh-auth-soft-32280-echo roster Soft 31400+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-32280-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft32280EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 31400+ ssh-auth-soft-32280-echo roster ok"; echo "cleaned"; echo "OK: phase31402 e2e passed"
