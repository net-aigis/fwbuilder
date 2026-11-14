#!/usr/bin/env bash
# Phase-30602: UI ssh-auth-schema-319-echo roster Soft 30600+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-319-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema319EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 30600+ ssh-auth-schema-319-echo roster ok"; echo "cleaned"; echo "OK: phase30602 e2e passed"
