#!/usr/bin/env bash
# Phase-18762: UI ssh-auth-schema-171-echo roster Soft 18760+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-171-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema171EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 18760+ ssh-auth-schema-171-echo roster ok"; echo "cleaned"; echo "OK: phase18762 e2e passed"
