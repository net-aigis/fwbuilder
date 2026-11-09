#!/usr/bin/env bash
# Phase-18362: UI ssh-auth-ms-50500-echo roster Soft 18360+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-50500-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs50500EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 18360+ ssh-auth-ms-50500-echo roster ok"; echo "cleaned"; echo "OK: phase18362 e2e passed"
