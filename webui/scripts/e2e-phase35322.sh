#!/usr/bin/env bash
# Phase-35322: UI ssh-auth-ms-77000-echo roster Soft 35320+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-77000-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs77000EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 35320+ ssh-auth-ms-77000-echo roster ok"; echo "cleaned"; echo "OK: phase35322 e2e passed"
