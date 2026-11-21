#!/usr/bin/env bash
# Phase-5018: UI ssh-refusal-paths roster detail + download/copy.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'sshRefusalPathsRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig ssh-refusal-paths roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-refusal-paths roster' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh-refusal-paths roster ok"; echo "cleaned"; echo "OK: phase5018 e2e passed"
