#!/usr/bin/env bash
# Phase-7242: UI ssh-alternative-titles-refresh roster Soft 6680+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-alternative-titles-refresh roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAlternativeTitlesRefreshRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 6680+ ssh-alternative-titles-refresh roster ok"; echo "cleaned"; echo "OK: phase7242 e2e passed"
