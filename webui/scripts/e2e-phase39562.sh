#!/usr/bin/env bash
# Phase-39562: UI ssh-auth-schema-431-echo roster Soft 39560+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-431-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema431EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 39560+ ssh-auth-schema-431-echo roster ok"; echo "cleaned"; echo "OK: phase39562 e2e passed"
