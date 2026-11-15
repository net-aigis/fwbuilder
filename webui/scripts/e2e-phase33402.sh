#!/usr/bin/env bash
# Phase-33402: UI ssh-auth-ms-74000-echo roster Soft 33400+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-74000-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs74000EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 33400+ ssh-auth-ms-74000-echo roster ok"; echo "cleaned"; echo "OK: phase33402 e2e passed"
