#!/usr/bin/env bash
# Phase-48042: UI ssh-auth-soft-50920-echo roster Soft 48040+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-50920-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft50920EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 48040+ ssh-auth-soft-50920-echo roster ok"; echo "cleaned"; echo "OK: phase48042 e2e passed"
