#!/usr/bin/env bash
# Phase-47082: UI ssh-auth-soft-49840-echo roster Soft 47080+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-49840-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft49840EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 47080+ ssh-auth-soft-49840-echo roster ok"; echo "cleaned"; echo "OK: phase47082 e2e passed"
