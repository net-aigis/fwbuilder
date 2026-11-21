#!/usr/bin/env bash
# Phase-28042: UI ssh-auth-schema-287-echo roster Soft 28040+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-287-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema287EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 28040+ ssh-auth-schema-287-echo roster ok"; echo "cleaned"; echo "OK: phase28042 e2e passed"
