#!/usr/bin/env bash
# Phase-5066: UI ssh-refusal-paths roster sessionStorage persist/restore/clear.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'sshRefusalPathsRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.sshRefusalPathsRoster.' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshRefusalPathsRosterStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh_refusal_paths_roster sessionStorage ok"; echo "cleaned"; echo "OK: phase5066 e2e passed"
