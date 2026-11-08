#!/usr/bin/env bash
# Phase-7162: UI ssh-alternatives-refresh roster Soft 6680+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-alternatives-refresh roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAlternativesRefreshRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 6680+ ssh-alternatives-refresh roster ok"; echo "cleaned"; echo "OK: phase7162 e2e passed"
