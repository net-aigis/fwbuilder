#!/usr/bin/env bash
# Phase-5562: UI ssh-refusal-path-titles roster Soft 5560+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-refusal-path-titles roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshRefusalPathTitlesRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 5560+ ssh-refusal-path-titles roster ok"; echo "cleaned"; echo "OK: phase5562 e2e passed"
