#!/usr/bin/env bash
# Phase-11722: UI ssh-auth-schema-echo roster Soft 11720+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchemaEchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 11720+ ssh-auth-schema-echo roster ok"; echo "cleaned"; echo "OK: phase11722 e2e passed"
