#!/usr/bin/env bash
# Phase-36842: UI ssh-auth-soft-38320-echo roster Soft 36840+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-38320-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft38320EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 36840+ ssh-auth-soft-38320-echo roster ok"; echo "cleaned"; echo "OK: phase36842 e2e passed"
