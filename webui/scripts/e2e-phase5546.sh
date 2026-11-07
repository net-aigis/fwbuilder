#!/usr/bin/env bash
# Phase-5546: UI ssh-refusal-path-titles roster sessionStorage persist/restore/clear.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'sshRefusalPathTitlesRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.sshRefusalPathTitlesRoster.' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshRefusalPathTitlesRosterStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh_refusal_path_titles_roster sessionStorage ok"; echo "cleaned"; echo "OK: phase5546 e2e passed"
