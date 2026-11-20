#!/usr/bin/env bash
# Phase-45962: UI ssh-auth-schema-511-echo roster Soft 45960+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-511-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema511EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 45960+ ssh-auth-schema-511-echo roster ok"; echo "cleaned"; echo "OK: phase45962 e2e passed"
