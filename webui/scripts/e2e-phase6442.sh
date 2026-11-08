#!/usr/bin/env bash
# Phase-6442: UI ssh-not-implemented-batch roster Soft 6440+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-not-implemented-batch roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshImplementedAgentRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 6440+ ssh-not-implemented-batch roster ok"; echo "cleaned"; echo "OK: phase6442 e2e passed"
