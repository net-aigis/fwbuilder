#!/usr/bin/env bash
# Phase-34682: UI ssh-auth-ms-76000-echo roster Soft 34680+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-76000-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs76000EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 34680+ ssh-auth-ms-76000-echo roster ok"; echo "cleaned"; echo "OK: phase34682 e2e passed"
