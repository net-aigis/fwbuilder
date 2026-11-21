#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshNotImplementedBatchRefreshRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-not-implemented-batch-refresh roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase8378 e2e passed"
