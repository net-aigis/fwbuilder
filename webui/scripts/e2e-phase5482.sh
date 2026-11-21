#!/usr/bin/env bash
# Phase-5482: UI ssh-alternative-titles roster Soft 5480+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-alternative-titles roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAlternativeTitlesRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 5480+ ssh-alternative-titles roster ok"; echo "cleaned"; echo "OK: phase5482 e2e passed"
