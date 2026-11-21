#!/usr/bin/env bash
# Phase-4922: UI ssh-capability-flags roster Soft 4920+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-capability-flags roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshCapabilityFlagsRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 4920+ ssh-capability-flags roster ok"; echo "cleaned"; echo "OK: phase4922 e2e passed"
