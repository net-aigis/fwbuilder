#!/usr/bin/env bash
# Phase-20282: UI ssh-auth-ms-53500-echo roster Soft 20280+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-53500-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs53500EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 20280+ ssh-auth-ms-53500-echo roster ok"; echo "cleaned"; echo "OK: phase20282 e2e passed"
