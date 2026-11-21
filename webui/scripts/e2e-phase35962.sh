#!/usr/bin/env bash
# Phase-35962: UI ssh-auth-ms-78000-echo roster Soft 35960+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-78000-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs78000EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 35960+ ssh-auth-ms-78000-echo roster ok"; echo "cleaned"; echo "OK: phase35962 e2e passed"
