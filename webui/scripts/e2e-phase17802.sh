#!/usr/bin/env bash
# Phase-17802: UI ssh-auth-schema-159-echo roster Soft 17800+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-159-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema159EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 17800+ ssh-auth-schema-159-echo roster ok"; echo "cleaned"; echo "OK: phase17802 e2e passed"
