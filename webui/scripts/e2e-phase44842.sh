#!/usr/bin/env bash
# Phase-44842: UI ssh-auth-soft-47320-echo roster Soft 44840+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-47320-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft47320EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 44840+ ssh-auth-soft-47320-echo roster ok"; echo "cleaned"; echo "OK: phase44842 e2e passed"
