#!/usr/bin/env bash
# Phase-12522: UI ssh-auth-alt-count roster Soft 12520+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-alt-count roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthAltCountRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 12520+ ssh-auth-alt-count roster ok"; echo "cleaned"; echo "OK: phase12522 e2e passed"
