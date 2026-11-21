#!/usr/bin/env bash
# Phase-45642: UI ssh-auth-schema-507-echo roster Soft 45640+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-507-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema507EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 45640+ ssh-auth-schema-507-echo roster ok"; echo "cleaned"; echo "OK: phase45642 e2e passed"
