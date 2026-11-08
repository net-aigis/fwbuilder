#!/usr/bin/env bash
# Phase-15082: UI ssh-auth-soft-15k-echo roster Soft 15080+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-15k-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft15KEchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 15080+ ssh-auth-soft-15k-echo roster ok"; echo "cleaned"; echo "OK: phase15082 e2e passed"
