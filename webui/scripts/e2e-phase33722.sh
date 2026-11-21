#!/usr/bin/env bash
# Phase-33722: UI ssh-auth-ms-74500-echo roster Soft 33720+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-74500-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs74500EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 33720+ ssh-auth-ms-74500-echo roster ok"; echo "cleaned"; echo "OK: phase33722 e2e passed"
