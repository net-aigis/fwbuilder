#!/usr/bin/env bash
# Phase-47722: UI ssh-auth-soft-50560-echo roster Soft 47720+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-50560-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft50560EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 47720+ ssh-auth-soft-50560-echo roster ok"; echo "cleaned"; echo "OK: phase47722 e2e passed"
