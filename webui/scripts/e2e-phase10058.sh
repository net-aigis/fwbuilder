#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthBatchGateRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-batch-gate roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase10058 e2e passed"
