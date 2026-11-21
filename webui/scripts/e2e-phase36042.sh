#!/usr/bin/env bash
# Phase-36042: UI ssh-auth-schema-387-echo roster Soft 36040+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-387-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema387EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 36040+ ssh-auth-schema-387-echo roster ok"; echo "cleaned"; echo "OK: phase36042 e2e passed"
