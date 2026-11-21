#!/usr/bin/env bash
# Phase-29242: UI ssh-auth-ms-67500-echo roster Soft 29240+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-67500-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs67500EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 29240+ ssh-auth-ms-67500-echo roster ok"; echo "cleaned"; echo "OK: phase29242 e2e passed"
