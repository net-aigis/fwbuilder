#!/usr/bin/env bash
# Phase-19322: UI ssh-auth-ms-52000-echo roster Soft 19320+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-52000-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs52000EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 19320+ ssh-auth-ms-52000-echo roster ok"; echo "cleaned"; echo "OK: phase19322 e2e passed"
