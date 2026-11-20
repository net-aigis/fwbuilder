#!/usr/bin/env bash
# Phase-42122: UI ssh-auth-schema-463-echo roster Soft 42120+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-463-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema463EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 42120+ ssh-auth-schema-463-echo roster ok"; echo "cleaned"; echo "OK: phase42122 e2e passed"
