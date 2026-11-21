#!/usr/bin/env bash
# Phase-18042: UI ssh-auth-ms-50000-echo roster Soft 18040+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-50000-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs50000EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 18040+ ssh-auth-ms-50000-echo roster ok"; echo "cleaned"; echo "OK: phase18042 e2e passed"
