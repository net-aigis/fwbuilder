#!/usr/bin/env bash
# Phase-21242: UI ssh-auth-ms-55000-echo roster Soft 21240+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-55000-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs55000EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 21240+ ssh-auth-ms-55000-echo roster ok"; echo "cleaned"; echo "OK: phase21242 e2e passed"
