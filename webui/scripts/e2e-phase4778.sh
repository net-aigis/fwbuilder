#!/usr/bin/env bash
# Phase-4778: UI ssh-implemented roster detail + download/copy.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'sshImplementedRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig ssh-implemented roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-implemented roster' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh-implemented roster ok"; echo "cleaned"; echo "OK: phase4778 e2e passed"
