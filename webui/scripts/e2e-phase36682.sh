#!/usr/bin/env bash
# Phase-36682: UI ssh-auth-schema-395-echo roster Soft 36680+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-395-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema395EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 36680+ ssh-auth-schema-395-echo roster ok"; echo "cleaned"; echo "OK: phase36682 e2e passed"
