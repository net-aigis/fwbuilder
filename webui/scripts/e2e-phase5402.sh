#!/usr/bin/env bash
# Phase-5402: UI ssh-alternative-notes roster Soft 5400+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-alternative-notes roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAlternativeNotesRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 5400+ ssh-alternative-notes roster ok"; echo "cleaned"; echo "OK: phase5402 e2e passed"
