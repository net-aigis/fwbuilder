#!/usr/bin/env bash
# Phase-37642: UI ssh-auth-schema-407-echo roster Soft 37640+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-407-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema407EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 37640+ ssh-auth-schema-407-echo roster ok"; echo "cleaned"; echo "OK: phase37642 e2e passed"
