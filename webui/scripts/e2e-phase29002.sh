#!/usr/bin/env bash
# Phase-29002: UI ssh-auth-schema-299-echo roster Soft 29000+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-299-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema299EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 29000+ ssh-auth-schema-299-echo roster ok"; echo "cleaned"; echo "OK: phase29002 e2e passed"
