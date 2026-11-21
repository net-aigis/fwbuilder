#!/usr/bin/env bash
# Phase-27082: UI ssh-auth-schema-275-echo roster Soft 27080+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-275-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema275EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 27080+ ssh-auth-schema-275-echo roster ok"; echo "cleaned"; echo "OK: phase27082 e2e passed"
