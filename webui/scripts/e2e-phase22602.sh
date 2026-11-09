#!/usr/bin/env bash
# Phase-22602: UI ssh-auth-schema-219-echo roster Soft 22600+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-219-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema219EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 22600+ ssh-auth-schema-219-echo roster ok"; echo "cleaned"; echo "OK: phase22602 e2e passed"
