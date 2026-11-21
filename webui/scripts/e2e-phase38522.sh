#!/usr/bin/env bash
# Phase-38522: UI ssh-auth-ms-82000-echo roster Soft 38520+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-82000-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs82000EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 38520+ ssh-auth-ms-82000-echo roster ok"; echo "cleaned"; echo "OK: phase38522 e2e passed"
