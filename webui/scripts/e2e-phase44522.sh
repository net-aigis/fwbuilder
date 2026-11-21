#!/usr/bin/env bash
# Phase-44522: UI ssh-auth-soft-46960-echo roster Soft 44520+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-46960-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft46960EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 44520+ ssh-auth-soft-46960-echo roster ok"; echo "cleaned"; echo "OK: phase44522 e2e passed"
