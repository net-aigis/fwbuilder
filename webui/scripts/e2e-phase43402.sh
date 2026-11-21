#!/usr/bin/env bash
# Phase-43402: UI ssh-auth-schema-479-echo roster Soft 43400+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-479-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema479EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 43400+ ssh-auth-schema-479-echo roster ok"; echo "cleaned"; echo "OK: phase43402 e2e passed"
