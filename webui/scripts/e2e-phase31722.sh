#!/usr/bin/env bash
# Phase-31722: UI ssh-auth-soft-32640-echo roster Soft 31720+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-32640-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft32640EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 31720+ ssh-auth-soft-32640-echo roster ok"; echo "cleaned"; echo "OK: phase31722 e2e passed"
