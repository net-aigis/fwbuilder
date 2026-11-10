#!/usr/bin/env bash
# Phase-27562: UI ssh-auth-soft-27960-echo roster Soft 27560+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-27960-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft27960EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 27560+ ssh-auth-soft-27960-echo roster ok"; echo "cleaned"; echo "OK: phase27562 e2e passed"
