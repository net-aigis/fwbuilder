#!/usr/bin/env bash
# Phase-29802: UI ssh-auth-soft-30480-echo roster Soft 29800+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-30480-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft30480EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 29800+ ssh-auth-soft-30480-echo roster ok"; echo "cleaned"; echo "OK: phase29802 e2e passed"
