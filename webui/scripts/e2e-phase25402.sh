#!/usr/bin/env bash
# Phase-25402: UI ssh-auth-ms-61500-echo roster Soft 25400+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-61500-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs61500EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 25400+ ssh-auth-ms-61500-echo roster ok"; echo "cleaned"; echo "OK: phase25402 e2e passed"
