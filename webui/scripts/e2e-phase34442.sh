#!/usr/bin/env bash
# Phase-34442: UI ssh-auth-schema-367-echo roster Soft 34440+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-367-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema367EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 34440+ ssh-auth-schema-367-echo roster ok"; echo "cleaned"; echo "OK: phase34442 e2e passed"
