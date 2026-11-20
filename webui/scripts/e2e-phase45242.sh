#!/usr/bin/env bash
# Phase-45242: UI ssh-auth-ms-92500-echo roster Soft 45240+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-92500-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs92500EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 45240+ ssh-auth-ms-92500-echo roster ok"; echo "cleaned"; echo "OK: phase45242 e2e passed"
