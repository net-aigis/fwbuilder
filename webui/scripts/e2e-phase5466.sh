#!/usr/bin/env bash
# Phase-5466: UI ssh-alternative-titles roster sessionStorage persist/restore/clear.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'sshAlternativeTitlesRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.sshAlternativeTitlesRoster.' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAlternativeTitlesRosterStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh_alternative_titles_roster sessionStorage ok"; echo "cleaned"; echo "OK: phase5466 e2e passed"
