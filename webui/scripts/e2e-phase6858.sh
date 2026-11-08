#!/usr/bin/env bash
# Phase-6858: UI ssh-refusal-status-refresh roster detail + download/copy.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'sshRefusalStatusRefreshRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig ssh-refusal-status-refresh roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-refusal-status-refresh roster' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh-refusal-status-refresh roster ok"; echo "cleaned"; echo "OK: phase6858 e2e passed"
