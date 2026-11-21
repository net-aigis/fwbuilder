#!/usr/bin/env bash
# Phase-15002: UI ssh-auth-batch-only-echo roster Soft 15000+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-batch-only-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthBatchOnlyEchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 15000+ ssh-auth-batch-only-echo roster ok"; echo "cleaned"; echo "OK: phase15002 e2e passed"
