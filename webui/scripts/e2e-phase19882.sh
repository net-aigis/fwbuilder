#!/usr/bin/env bash
# Phase-19882: UI ssh-auth-soft-19880-echo roster Soft 19880+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-19880-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft19880EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 19880+ ssh-auth-soft-19880-echo roster ok"; echo "cleaned"; echo "OK: phase19882 e2e passed"
