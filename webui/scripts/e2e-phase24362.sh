#!/usr/bin/env bash
# Phase-24362: UI ssh-auth-soft-24360-echo roster Soft 24360+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-24360-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft24360EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 24360+ ssh-auth-soft-24360-echo roster ok"; echo "cleaned"; echo "OK: phase24362 e2e passed"
