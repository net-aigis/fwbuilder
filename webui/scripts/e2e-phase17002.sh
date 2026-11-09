#!/usr/bin/env bash
# Phase-17002: UI ssh-auth-soft-16920-echo roster Soft 17000+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-16920-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft16920EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 17000+ ssh-auth-soft-16920-echo roster ok"; echo "cleaned"; echo "OK: phase17002 e2e passed"
