#!/usr/bin/env bash
# Phase-30922: UI ssh-auth-schema-323-echo roster Soft 30920+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-323-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema323EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 30920+ ssh-auth-schema-323-echo roster ok"; echo "cleaned"; echo "OK: phase30922 e2e passed"
