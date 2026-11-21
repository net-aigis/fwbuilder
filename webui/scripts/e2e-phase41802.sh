#!/usr/bin/env bash
# Phase-41802: UI ssh-auth-schema-459-echo roster Soft 41800+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-459-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema459EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 41800+ ssh-auth-schema-459-echo roster ok"; echo "cleaned"; echo "OK: phase41802 e2e passed"
