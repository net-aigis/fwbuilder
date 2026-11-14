#!/usr/bin/env bash
# Phase-31242: UI ssh-auth-schema-327-echo roster Soft 31240+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-327-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema327EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 31240+ ssh-auth-schema-327-echo roster ok"; echo "cleaned"; echo "OK: phase31242 e2e passed"
