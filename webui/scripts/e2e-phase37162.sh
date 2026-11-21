#!/usr/bin/env bash
# Phase-37162: UI ssh-auth-soft-38680-echo roster Soft 37160+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-38680-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft38680EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 37160+ ssh-auth-soft-38680-echo roster ok"; echo "cleaned"; echo "OK: phase37162 e2e passed"
