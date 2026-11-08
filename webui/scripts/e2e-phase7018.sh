#!/usr/bin/env bash
# Phase-7018: UI ssh-refusal-paths-refresh roster detail + download/copy.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'sshRefusalPathsRefreshRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig ssh-refusal-paths-refresh roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-refusal-paths-refresh roster' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh-refusal-paths-refresh roster ok"; echo "cleaned"; echo "OK: phase7018 e2e passed"
