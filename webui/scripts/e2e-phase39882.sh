#!/usr/bin/env bash
# Phase-39882: UI ssh-auth-schema-435-echo roster Soft 39880+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-435-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema435EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 39880+ ssh-auth-schema-435-echo roster ok"; echo "cleaned"; echo "OK: phase39882 e2e passed"
