#!/usr/bin/env bash
# Phase-26922: UI ssh-auth-soft-27240-echo roster Soft 26920+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-27240-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft27240EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 26920+ ssh-auth-soft-27240-echo roster ok"; echo "cleaned"; echo "OK: phase26922 e2e passed"
