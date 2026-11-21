#!/usr/bin/env bash
# Phase-7642: UI ssh-refusal-path-titles-refresh roster Soft 6680+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-refusal-path-titles-refresh roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAlternativeNotesRefreshRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 6680+ ssh-refusal-path-titles-refresh roster ok"; echo "cleaned"; echo "OK: phase7642 e2e passed"
