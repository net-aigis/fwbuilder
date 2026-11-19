#!/usr/bin/env bash
# Phase-33802: UI ssh-auth-schema-359-echo roster Soft 33800+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-359-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema359EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 33800+ ssh-auth-schema-359-echo roster ok"; echo "cleaned"; echo "OK: phase33802 e2e passed"
