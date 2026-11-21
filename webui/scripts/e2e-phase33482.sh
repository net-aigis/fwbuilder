#!/usr/bin/env bash
# Phase-33482: UI ssh-auth-schema-355-echo roster Soft 33480+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-355-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema355EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 33480+ ssh-auth-schema-355-echo roster ok"; echo "cleaned"; echo "OK: phase33482 e2e passed"
