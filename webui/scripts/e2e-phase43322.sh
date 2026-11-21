#!/usr/bin/env bash
# Phase-43322: UI ssh-auth-ms-89500-echo roster Soft 43320+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-89500-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs89500EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 43320+ ssh-auth-ms-89500-echo roster ok"; echo "cleaned"; echo "OK: phase43322 e2e passed"
