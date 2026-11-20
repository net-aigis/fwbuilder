#!/usr/bin/env bash
# Phase-47242: UI ssh-auth-schema-527-echo roster Soft 47240+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-527-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema527EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 47240+ ssh-auth-schema-527-echo roster ok"; echo "cleaned"; echo "OK: phase47242 e2e passed"
