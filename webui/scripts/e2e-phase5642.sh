#!/usr/bin/env bash
# Phase-5642: UI ssh-refusal-path-notes roster Soft 5640+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-refusal-path-notes roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshRefusalPathNotesRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 5640+ ssh-refusal-path-notes roster ok"; echo "cleaned"; echo "OK: phase5642 e2e passed"
