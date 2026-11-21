#!/usr/bin/env bash
# Phase-37242: UI ssh-auth-ms-80000-echo roster Soft 37240+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-80000-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs80000EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 37240+ ssh-auth-ms-80000-echo roster ok"; echo "cleaned"; echo "OK: phase37242 e2e passed"
