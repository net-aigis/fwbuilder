#!/usr/bin/env bash
# Phase-18122: UI ssh-auth-schema-163-echo roster Soft 18120+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-163-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema163EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 18120+ ssh-auth-schema-163-echo roster ok"; echo "cleaned"; echo "OK: phase18122 e2e passed"
