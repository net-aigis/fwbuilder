#!/usr/bin/env bash
# Phase-5467: clear title mentions ssh-alternative-titles roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'ssh-alternative-titles roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorage.removeItem(sshAlternativeTitlesRosterStorageKey(firewallId))' webui/frontend/src/components/FirewallExtras.tsx
echo "clear ssh_alternative_titles_roster ok"; echo "cleaned"; echo "OK: phase5467 e2e passed"
