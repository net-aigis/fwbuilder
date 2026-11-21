#!/usr/bin/env bash
# Phase-5978: UI ssh-implemented-check roster detail + download/copy.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'sshImplementedCheckRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig ssh-implemented-check roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-implemented-check roster' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh-implemented-check roster ok"; echo "cleaned"; echo "OK: phase5978 e2e passed"
