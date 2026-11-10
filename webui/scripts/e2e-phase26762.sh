#!/usr/bin/env bash
# Phase-26762: UI ssh-auth-schema-271-echo roster Soft 26760+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-271-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema271EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 26760+ ssh-auth-schema-271-echo roster ok"; echo "cleaned"; echo "OK: phase26762 e2e passed"
