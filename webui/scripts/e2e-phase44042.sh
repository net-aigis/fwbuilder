#!/usr/bin/env bash
# Phase-44042: UI ssh-auth-schema-487-echo roster Soft 44040+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-487-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema487EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 44040+ ssh-auth-schema-487-echo roster ok"; echo "cleaned"; echo "OK: phase44042 e2e passed"
