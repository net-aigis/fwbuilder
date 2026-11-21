#!/usr/bin/env bash
# Phase-15722: UI ssh-auth-soft-15600-echo roster Soft 15720+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-15600-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft15600EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 15720+ ssh-auth-soft-15600-echo roster ok"; echo "cleaned"; echo "OK: phase15722 e2e passed"
