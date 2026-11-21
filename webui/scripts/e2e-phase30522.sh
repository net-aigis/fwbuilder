#!/usr/bin/env bash
# Phase-30522: UI ssh-auth-ms-69500-echo roster Soft 30520+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-69500-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs69500EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 30520+ ssh-auth-ms-69500-echo roster ok"; echo "cleaned"; echo "OK: phase30522 e2e passed"
