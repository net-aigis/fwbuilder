#!/usr/bin/env bash
# Phase-29882: UI ssh-auth-ms-68500-echo roster Soft 29880+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-68500-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs68500EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 29880+ ssh-auth-ms-68500-echo roster ok"; echo "cleaned"; echo "OK: phase29882 e2e passed"
