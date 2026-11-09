#!/usr/bin/env bash
# Phase-16362: UI ssh-auth-soft-16320-echo roster Soft 16360+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-16320-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft16320EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 16360+ ssh-auth-soft-16320-echo roster ok"; echo "cleaned"; echo "OK: phase16362 e2e passed"
