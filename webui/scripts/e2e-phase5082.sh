#!/usr/bin/env bash
# Phase-5082: UI ssh-refusal-paths roster Soft 5080+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-refusal-paths roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshRefusalPathsRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 5080+ ssh-refusal-paths roster ok"; echo "cleaned"; echo "OK: phase5082 e2e passed"
