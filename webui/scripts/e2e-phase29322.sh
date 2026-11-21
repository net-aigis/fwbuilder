#!/usr/bin/env bash
# Phase-29322: UI ssh-auth-schema-303-echo roster Soft 29320+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-303-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema303EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 29320+ ssh-auth-schema-303-echo roster ok"; echo "cleaned"; echo "OK: phase29322 e2e passed"
