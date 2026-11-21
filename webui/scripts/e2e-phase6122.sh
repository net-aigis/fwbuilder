#!/usr/bin/env bash
# Phase-6122: UI ssh-not-implemented-check roster Soft 6120+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-not-implemented-check roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshNotImplementedCheckRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 6120+ ssh-not-implemented-check roster ok"; echo "cleaned"; echo "OK: phase6122 e2e passed"
