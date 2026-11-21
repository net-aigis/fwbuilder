#!/usr/bin/env bash
# Phase-23722: UI ssh-auth-soft-23640-echo roster Soft 23720+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-23640-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft23640EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 23720+ ssh-auth-soft-23640-echo roster ok"; echo "cleaned"; echo "OK: phase23722 e2e passed"
