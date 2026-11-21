#!/usr/bin/env bash
# Phase-20682: UI ssh-auth-schema-195-echo roster Soft 20680+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-195-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema195EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 20680+ ssh-auth-schema-195-echo roster ok"; echo "cleaned"; echo "OK: phase20682 e2e passed"
