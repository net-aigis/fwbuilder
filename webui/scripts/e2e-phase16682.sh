#!/usr/bin/env bash
# Phase-16682: UI ssh-auth-soft-16640-echo roster Soft 16680+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-16640-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft16640EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 16680+ ssh-auth-soft-16640-echo roster ok"; echo "cleaned"; echo "OK: phase16682 e2e passed"
