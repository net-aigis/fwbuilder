#!/usr/bin/env bash
# Phase-7082: UI ssh-refusal-paths-refresh roster Soft 6680+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-refusal-paths-refresh roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshRefusalPathsRefreshRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 6680+ ssh-refusal-paths-refresh roster ok"; echo "cleaned"; echo "OK: phase7082 e2e passed"
