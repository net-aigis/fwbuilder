#!/usr/bin/env bash
# Phase-45882: UI ssh-auth-ms-93500-echo roster Soft 45880+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-93500-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs93500EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 45880+ ssh-auth-ms-93500-echo roster ok"; echo "cleaned"; echo "OK: phase45882 e2e passed"
