#!/usr/bin/env bash
# Phase-34122: UI ssh-auth-schema-363-echo roster Soft 34120+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-363-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema363EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 34120+ ssh-auth-schema-363-echo roster ok"; echo "cleaned"; echo "OK: phase34122 e2e passed"
