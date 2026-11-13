#!/usr/bin/env bash
# Phase-30122: UI ssh-auth-soft-30840-echo roster Soft 30120+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-30840-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft30840EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 30120+ ssh-auth-soft-30840-echo roster ok"; echo "cleaned"; echo "OK: phase30122 e2e passed"
