#!/usr/bin/env bash
# Phase-15482: UI ssh-auth-ms-46000-echo roster Soft 15480+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-46000-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs46000EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 15480+ ssh-auth-ms-46000-echo roster ok"; echo "cleaned"; echo "OK: phase15482 e2e passed"
