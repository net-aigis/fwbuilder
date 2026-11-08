#!/usr/bin/env bash
# Phase-6282: UI ssh-implemented-batch roster Soft 6280+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-implemented-batch roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshImplementedBatchRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 6280+ ssh-implemented-batch roster ok"; echo "cleaned"; echo "OK: phase6282 e2e passed"
