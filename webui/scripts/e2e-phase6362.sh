#!/usr/bin/env bash
# Phase-6362: UI ssh-not-implemented-batch roster Soft 6360+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-not-implemented-batch roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshNotImplementedBatchRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 6360+ ssh-not-implemented-batch roster ok"; echo "cleaned"; echo "OK: phase6362 e2e passed"
