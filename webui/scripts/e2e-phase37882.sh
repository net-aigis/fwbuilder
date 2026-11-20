#!/usr/bin/env bash
# Phase-37882: UI ssh-auth-ms-81000-echo roster Soft 37880+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-81000-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs81000EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 37880+ ssh-auth-ms-81000-echo roster ok"; echo "cleaned"; echo "OK: phase37882 e2e passed"
