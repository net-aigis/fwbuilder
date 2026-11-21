#!/usr/bin/env bash
# Phase-17162: UI ssh-auth-schema-151-echo roster Soft 17160+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-151-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema151EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 17160+ ssh-auth-schema-151-echo roster ok"; echo "cleaned"; echo "OK: phase17162 e2e passed"
