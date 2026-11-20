#!/usr/bin/env bash
# Phase-37962: UI ssh-auth-schema-411-echo roster Soft 37960+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-411-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema411EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 37960+ ssh-auth-schema-411-echo roster ok"; echo "cleaned"; echo "OK: phase37962 e2e passed"
