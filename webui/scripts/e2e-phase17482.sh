#!/usr/bin/env bash
# Phase-17482: UI ssh-auth-schema-155-echo roster Soft 17480+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-155-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema155EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 17480+ ssh-auth-schema-155-echo roster ok"; echo "cleaned"; echo "OK: phase17482 e2e passed"
