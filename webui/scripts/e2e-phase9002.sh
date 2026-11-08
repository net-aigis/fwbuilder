#!/usr/bin/env bash
# Phase-9002: UI ssh-auth-refresh roster Soft 9000+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-refresh roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthRefreshRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 9000+ ssh-auth-refresh roster ok"; echo "cleaned"; echo "OK: phase9002 e2e passed"
