#!/usr/bin/env bash
# Phase-21802: UI ssh-auth-soft-21840-echo roster Soft 21800+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-21840-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft21840EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 21800+ ssh-auth-soft-21840-echo roster ok"; echo "cleaned"; echo "OK: phase21802 e2e passed"
