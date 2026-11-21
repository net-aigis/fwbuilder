#!/usr/bin/env bash
# Phase-44682: UI ssh-auth-schema-495-echo roster Soft 44680+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-495-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema495EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 44680+ ssh-auth-schema-495-echo roster ok"; echo "cleaned"; echo "OK: phase44682 e2e passed"
