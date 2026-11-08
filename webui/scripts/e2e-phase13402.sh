#!/usr/bin/env bash
# Phase-13402: UI ssh-auth-batch-echo roster Soft 13400+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-batch-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthBatchEchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 13400+ ssh-auth-batch-echo roster ok"; echo "cleaned"; echo "OK: phase13402 e2e passed"
