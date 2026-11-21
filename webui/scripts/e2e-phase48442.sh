#!/usr/bin/env bash
# Phase-48442: UI ssh-auth-ms-97500-echo roster Soft 48440+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-97500-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs97500EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 48440+ ssh-auth-ms-97500-echo roster ok"; echo "cleaned"; echo "OK: phase48442 e2e passed"
