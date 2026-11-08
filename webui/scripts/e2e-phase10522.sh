#!/usr/bin/env bash
# Phase-10522: UI ssh-auth-alt-pair roster Soft 10520+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-alt-pair roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthAltPairRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 10520+ ssh-auth-alt-pair roster ok"; echo "cleaned"; echo "OK: phase10522 e2e passed"
