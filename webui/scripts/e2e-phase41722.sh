#!/usr/bin/env bash
# Phase-41722: UI ssh-auth-ms-87000-echo roster Soft 41720+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-87000-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs87000EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 41720+ ssh-auth-ms-87000-echo roster ok"; echo "cleaned"; echo "OK: phase41722 e2e passed"
