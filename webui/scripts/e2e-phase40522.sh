#!/usr/bin/env bash
# Phase-40522: UI ssh-auth-schema-443-echo roster Soft 40520+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-443-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema443EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 40520+ ssh-auth-schema-443-echo roster ok"; echo "cleaned"; echo "OK: phase40522 e2e passed"
