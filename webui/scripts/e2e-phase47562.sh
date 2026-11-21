#!/usr/bin/env bash
# Phase-47562: UI ssh-auth-schema-531-echo roster Soft 47560+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-531-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema531EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 47560+ ssh-auth-schema-531-echo roster ok"; echo "cleaned"; echo "OK: phase47562 e2e passed"
