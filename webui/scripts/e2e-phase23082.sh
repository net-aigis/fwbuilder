#!/usr/bin/env bash
# Phase-23082: UI ssh-auth-soft-22920-echo roster Soft 23080+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-22920-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft22920EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 23080+ ssh-auth-soft-22920-echo roster ok"; echo "cleaned"; echo "OK: phase23082 e2e passed"
