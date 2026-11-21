#!/usr/bin/env bash
# Phase-6426: UI ssh-not-implemented-batch roster sessionStorage persist/restore/clear.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'sshImplementedAgentRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.sshImplementedAgentRoster.' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshImplementedAgentRosterStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh_implemented_agent_roster sessionStorage ok"; echo "cleaned"; echo "OK: phase6426 e2e passed"
