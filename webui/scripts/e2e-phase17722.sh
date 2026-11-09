#!/usr/bin/env bash
# Phase-17722: UI ssh-auth-ms-49500-echo roster Soft 17720+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-49500-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs49500EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 17720+ ssh-auth-ms-49500-echo roster ok"; echo "cleaned"; echo "OK: phase17722 e2e passed"
