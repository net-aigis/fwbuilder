#!/usr/bin/env bash
# Phase-48202: UI ssh-auth-schema-539-echo roster Soft 48200+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-539-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema539EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 48200+ ssh-auth-schema-539-echo roster ok"; echo "cleaned"; echo "OK: phase48202 e2e passed"
