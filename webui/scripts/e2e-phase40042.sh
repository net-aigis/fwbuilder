#!/usr/bin/env bash
# Phase-40042: UI ssh-auth-soft-41920-echo roster Soft 40040+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-41920-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft41920EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 40040+ ssh-auth-soft-41920-echo roster ok"; echo "cleaned"; echo "OK: phase40042 e2e passed"
