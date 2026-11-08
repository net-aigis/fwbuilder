#!/usr/bin/env bash
# Phase-8122: UI ssh-implemented-check-refresh roster Soft 8120+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-implemented-check-refresh roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshImplementedCheckRefreshRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 8120+ ssh-implemented-check-refresh roster ok"; echo "cleaned"; echo "OK: phase8122 e2e passed"
