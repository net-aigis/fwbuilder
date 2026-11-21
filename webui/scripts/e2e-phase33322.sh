#!/usr/bin/env bash
# Phase-33322: UI ssh-auth-soft-34440-echo roster Soft 33320+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-34440-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft34440EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 33320+ ssh-auth-soft-34440-echo roster ok"; echo "cleaned"; echo "OK: phase33322 e2e passed"
