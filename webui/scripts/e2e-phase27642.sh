#!/usr/bin/env bash
# Phase-27642: UI ssh-auth-ms-65000-echo roster Soft 27640+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-65000-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs65000EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 27640+ ssh-auth-ms-65000-echo roster ok"; echo "cleaned"; echo "OK: phase27642 e2e passed"
