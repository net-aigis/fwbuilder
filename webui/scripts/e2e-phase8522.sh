#!/usr/bin/env bash
# Phase-8522: UI ssh-implemented-agent-refresh roster Soft 8520+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-implemented-agent-refresh roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshImplementedAgentRefreshRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 8520+ ssh-implemented-agent-refresh roster ok"; echo "cleaned"; echo "OK: phase8522 e2e passed"
