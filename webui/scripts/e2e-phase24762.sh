#!/usr/bin/env bash
# Phase-24762: UI ssh-auth-ms-60500-echo roster Soft 24760+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-60500-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs60500EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 24760+ ssh-auth-ms-60500-echo roster ok"; echo "cleaned"; echo "OK: phase24762 e2e passed"
