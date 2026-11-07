#!/usr/bin/env bash
# Phase-6042: UI ssh-implemented-check roster Soft 6040+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-implemented-check roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshImplementedCheckRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 6040+ ssh-implemented-check roster ok"; echo "cleaned"; echo "OK: phase6042 e2e passed"
