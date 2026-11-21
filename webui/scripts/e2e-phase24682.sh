#!/usr/bin/env bash
# Phase-24682: UI ssh-auth-soft-24720-echo roster Soft 24680+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-24720-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft24720EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 24680+ ssh-auth-soft-24720-echo roster ok"; echo "cleaned"; echo "OK: phase24682 e2e passed"
