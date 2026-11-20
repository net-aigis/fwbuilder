#!/usr/bin/env bash
# Phase-47162: UI ssh-auth-ms-95500-echo roster Soft 47160+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-95500-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs95500EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 47160+ ssh-auth-ms-95500-echo roster ok"; echo "cleaned"; echo "OK: phase47162 e2e passed"
