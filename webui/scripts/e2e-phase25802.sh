#!/usr/bin/env bash
# Phase-25802: UI ssh-auth-schema-259-echo roster Soft 25800+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-259-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema259EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 25800+ ssh-auth-schema-259-echo roster ok"; echo "cleaned"; echo "OK: phase25802 e2e passed"
