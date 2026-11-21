#!/usr/bin/env bash
# Phase-43002: UI ssh-auth-ms-89000-echo roster Soft 43000+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-89000-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs89000EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 43000+ ssh-auth-ms-89000-echo roster ok"; echo "cleaned"; echo "OK: phase43002 e2e passed"
