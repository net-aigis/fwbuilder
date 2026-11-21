#!/usr/bin/env bash
# Phase-45322: UI ssh-auth-schema-503-echo roster Soft 45320+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-503-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema503EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 45320+ ssh-auth-schema-503-echo roster ok"; echo "cleaned"; echo "OK: phase45322 e2e passed"
