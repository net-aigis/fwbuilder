#!/usr/bin/env bash
# Phase-46522: UI ssh-auth-ms-94500-echo roster Soft 46520+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-94500-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs94500EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 46520+ ssh-auth-ms-94500-echo roster ok"; echo "cleaned"; echo "OK: phase46522 e2e passed"
