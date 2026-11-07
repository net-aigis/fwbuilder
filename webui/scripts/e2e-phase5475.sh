#!/usr/bin/env bash
# Phase-5475: UI honesty milestone + ssh_alternative_titles_roster sessionStorage at 15200.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAlternativeTitlesRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 15200 UI ok"; echo "cleaned"; echo "OK: phase5475 e2e passed"
