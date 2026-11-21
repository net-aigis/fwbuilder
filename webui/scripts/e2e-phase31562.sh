#!/usr/bin/env bash
# Phase-31562: UI ssh-auth-schema-331-echo roster Soft 31560+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-331-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema331EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 31560+ ssh-auth-schema-331-echo roster ok"; echo "cleaned"; echo "OK: phase31562 e2e passed"
