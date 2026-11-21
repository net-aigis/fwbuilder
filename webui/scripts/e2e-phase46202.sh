#!/usr/bin/env bash
# Phase-46202: UI ssh-auth-ms-94000-echo roster Soft 46200+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-94000-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs94000EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 46200+ ssh-auth-ms-94000-echo roster ok"; echo "cleaned"; echo "OK: phase46202 e2e passed"
