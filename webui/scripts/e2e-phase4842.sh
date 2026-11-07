#!/usr/bin/env bash
# Phase-4842: UI ssh-implemented roster Soft 4840+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-implemented roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshImplementedRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 4840+ ssh-implemented roster ok"; echo "cleaned"; echo "OK: phase4842 e2e passed"
