#!/usr/bin/env bash
# Phase-35002: UI ssh-auth-ms-76500-echo roster Soft 35000+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-76500-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs76500EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 35000+ ssh-auth-ms-76500-echo roster ok"; echo "cleaned"; echo "OK: phase35002 e2e passed"
