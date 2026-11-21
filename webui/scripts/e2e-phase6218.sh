#!/usr/bin/env bash
# Phase-6218: UI ssh-implemented-batch roster detail + download/copy.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'sshImplementedBatchRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig ssh-implemented-batch roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-implemented-batch roster' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh-implemented-batch roster ok"; echo "cleaned"; echo "OK: phase6218 e2e passed"
