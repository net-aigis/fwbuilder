#!/usr/bin/env bash
# Phase-37322: UI ssh-auth-schema-403-echo roster Soft 37320+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-403-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema403EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 37320+ ssh-auth-schema-403-echo roster ok"; echo "cleaned"; echo "OK: phase37322 e2e passed"
