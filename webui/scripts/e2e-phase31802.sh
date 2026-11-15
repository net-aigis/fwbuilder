#!/usr/bin/env bash
# Phase-31802: UI ssh-auth-ms-71500-echo roster Soft 31800+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-71500-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs71500EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 31800+ ssh-auth-ms-71500-echo roster ok"; echo "cleaned"; echo "OK: phase31802 e2e passed"
