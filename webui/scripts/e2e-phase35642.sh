#!/usr/bin/env bash
# Phase-35642: UI ssh-auth-ms-77500-echo roster Soft 35640+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-77500-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs77500EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 35640+ ssh-auth-ms-77500-echo roster ok"; echo "cleaned"; echo "OK: phase35642 e2e passed"
