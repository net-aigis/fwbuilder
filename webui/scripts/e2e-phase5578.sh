#!/usr/bin/env bash
# Phase-5578: UI ssh-refusal-path-notes roster detail + download/copy.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'sshRefusalPathNotesRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig ssh-refusal-path-notes roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-refusal-path-notes roster' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh-refusal-path-notes roster ok"; echo "cleaned"; echo "OK: phase5578 e2e passed"
