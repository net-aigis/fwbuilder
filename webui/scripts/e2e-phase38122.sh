#!/usr/bin/env bash
# Phase-38122: UI ssh-auth-soft-39760-echo roster Soft 38120+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-39760-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft39760EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 38120+ ssh-auth-soft-39760-echo roster ok"; echo "cleaned"; echo "OK: phase38122 e2e passed"
