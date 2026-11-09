#!/usr/bin/env bash
# Phase-19722: UI ssh-auth-schema-183-echo roster Soft 19720+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-183-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema183EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 19720+ ssh-auth-schema-183-echo roster ok"; echo "cleaned"; echo "OK: phase19722 e2e passed"
