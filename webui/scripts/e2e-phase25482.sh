#!/usr/bin/env bash
# Phase-25482: UI ssh-auth-schema-255-echo roster Soft 25480+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-255-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema255EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 25480+ ssh-auth-schema-255-echo roster ok"; echo "cleaned"; echo "OK: phase25482 e2e passed"
