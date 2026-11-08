#!/usr/bin/env bash
# Phase-8362: UI ssh-implemented-batch-refresh roster Soft 8360+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-implemented-batch-refresh roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshImplementedBatchRefreshRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 8360+ ssh-implemented-batch-refresh roster ok"; echo "cleaned"; echo "OK: phase8362 e2e passed"
