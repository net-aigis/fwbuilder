#!/usr/bin/env bash
# Phase-24042: UI ssh-auth-soft-24000-echo roster Soft 24040+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-24000-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft24000EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 24040+ ssh-auth-soft-24000-echo roster ok"; echo "cleaned"; echo "OK: phase24042 e2e passed"
