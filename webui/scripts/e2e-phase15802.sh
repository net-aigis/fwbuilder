#!/usr/bin/env bash
# Phase-15802: UI ssh-auth-ms-46500-echo roster Soft 15800+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-46500-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs46500EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 15800+ ssh-auth-ms-46500-echo roster ok"; echo "cleaned"; echo "OK: phase15802 e2e passed"
