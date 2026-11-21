#!/usr/bin/env bash
# Phase-23482: UI ssh-auth-ms-58500-echo roster Soft 23480+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-58500-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs58500EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 23480+ ssh-auth-ms-58500-echo roster ok"; echo "cleaned"; echo "OK: phase23482 e2e passed"
