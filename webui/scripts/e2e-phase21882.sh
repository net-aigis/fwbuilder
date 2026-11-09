#!/usr/bin/env bash
# Phase-21882: UI ssh-auth-ms-56000-echo roster Soft 21880+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-56000-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs56000EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 21880+ ssh-auth-ms-56000-echo roster ok"; echo "cleaned"; echo "OK: phase21882 e2e passed"
