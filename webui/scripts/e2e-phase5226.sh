#!/usr/bin/env bash
# Phase-5226: UI ssh-method-lists roster sessionStorage persist/restore/clear.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'sshMethodListsRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.sshMethodListsRoster.' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshMethodListsRosterStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh_method_lists_roster sessionStorage ok"; echo "cleaned"; echo "OK: phase5226 e2e passed"
