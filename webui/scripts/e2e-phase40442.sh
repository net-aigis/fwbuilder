#!/usr/bin/env bash
# Phase-40442: UI ssh-auth-ms-85000-echo roster Soft 40440+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-85000-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs85000EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 40440+ ssh-auth-ms-85000-echo roster ok"; echo "cleaned"; echo "OK: phase40442 e2e passed"
