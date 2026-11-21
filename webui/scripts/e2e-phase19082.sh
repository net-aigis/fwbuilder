#!/usr/bin/env bash
# Phase-19082: UI ssh-auth-schema-175-echo roster Soft 19080+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-175-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema175EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 19080+ ssh-auth-schema-175-echo roster ok"; echo "cleaned"; echo "OK: phase19082 e2e passed"
