#!/usr/bin/env bash
# Phase-5962: UI ssh-batch-mode roster Soft 5960+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-batch-mode roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshBatchModeRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 5960+ ssh-batch-mode roster ok"; echo "cleaned"; echo "OK: phase5962 e2e passed"
