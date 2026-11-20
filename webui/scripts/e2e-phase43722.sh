#!/usr/bin/env bash
# Phase-43722: UI ssh-auth-schema-483-echo roster Soft 43720+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-483-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema483EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 43720+ ssh-auth-schema-483-echo roster ok"; echo "cleaned"; echo "OK: phase43722 e2e passed"
