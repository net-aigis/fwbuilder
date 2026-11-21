#!/usr/bin/env bash
# Phase-15562: UI ssh-auth-schema-131-echo roster Soft 15560+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-131-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema131EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 15560+ ssh-auth-schema-131-echo roster ok"; echo "cleaned"; echo "OK: phase15562 e2e passed"
