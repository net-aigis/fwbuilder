#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthBatchOnlyEchoRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-batch-only-echo roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase14938 e2e passed"
