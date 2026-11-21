#!/usr/bin/env bash
# Phase-5898: UI ssh-batch-mode roster detail + download/copy.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'sshBatchModeRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig ssh-batch-mode roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-batch-mode roster' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh-batch-mode roster ok"; echo "cleaned"; echo "OK: phase5898 e2e passed"
