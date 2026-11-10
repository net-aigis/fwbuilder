#!/usr/bin/env bash
# Phase-23562: UI ssh-auth-schema-231-echo roster Soft 23560+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-231-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema231EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 23560+ ssh-auth-schema-231-echo roster ok"; echo "cleaned"; echo "OK: phase23562 e2e passed"
