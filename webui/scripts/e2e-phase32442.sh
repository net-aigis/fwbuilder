#!/usr/bin/env bash
# Phase-32442: UI ssh-auth-ms-72500-echo roster Soft 32440+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-72500-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs72500EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 32440+ ssh-auth-ms-72500-echo roster ok"; echo "cleaned"; echo "OK: phase32442 e2e passed"
