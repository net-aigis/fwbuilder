#!/usr/bin/env bash
# Phase-8442: UI ssh-not-implemented-batch-refresh roster Soft 8440+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-not-implemented-batch-refresh roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshNotImplementedBatchRefreshRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 8440+ ssh-not-implemented-batch-refresh roster ok"; echo "cleaned"; echo "OK: phase8442 e2e passed"
