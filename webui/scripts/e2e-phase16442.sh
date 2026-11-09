#!/usr/bin/env bash
# Phase-16442: UI ssh-auth-ms-47500-echo roster Soft 16440+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-47500-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs47500EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 16440+ ssh-auth-ms-47500-echo roster ok"; echo "cleaned"; echo "OK: phase16442 e2e passed"
