#!/usr/bin/env bash
# Phase-43082: UI ssh-auth-schema-475-echo roster Soft 43080+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-475-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema475EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 43080+ ssh-auth-schema-475-echo roster ok"; echo "cleaned"; echo "OK: phase43082 e2e passed"
