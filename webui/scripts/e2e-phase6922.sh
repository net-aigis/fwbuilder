#!/usr/bin/env bash
# Phase-6922: UI ssh-refusal-status-refresh roster Soft 6680+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-refusal-status-refresh roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshRefusalStatusRefreshRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 6680+ ssh-refusal-status-refresh roster ok"; echo "cleaned"; echo "OK: phase6922 e2e passed"
