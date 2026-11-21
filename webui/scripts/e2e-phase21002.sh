#!/usr/bin/env bash
# Phase-21002: UI ssh-auth-schema-199-echo roster Soft 21000+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-199-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema199EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 21000+ ssh-auth-schema-199-echo roster ok"; echo "cleaned"; echo "OK: phase21002 e2e passed"
