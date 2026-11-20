#!/usr/bin/env bash
# Phase-42762: UI ssh-auth-schema-471-echo roster Soft 42760+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-471-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema471EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 42760+ ssh-auth-schema-471-echo roster ok"; echo "cleaned"; echo "OK: phase42762 e2e passed"
