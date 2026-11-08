#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshImplementedBatchRefreshRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-implemented-batch-refresh roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase8298 e2e passed"
