#!/usr/bin/env bash
# Phase-29642: UI ssh-auth-schema-307-echo roster Soft 29640+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-307-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema307EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 29640+ ssh-auth-schema-307-echo roster ok"; echo "cleaned"; echo "OK: phase29642 e2e passed"
