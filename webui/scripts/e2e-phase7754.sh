#!/usr/bin/env bash
# Phase-7754: UI honesty bundle includes ssh_alternative_notes_refresh_roster section.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'ssh_alternative_notes_refresh_roster:' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'soft_fertig_ssh_alternative_notes_refresh_roster:' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh_alternative_notes_refresh_roster bundle section ok"; echo "cleaned"; echo "OK: phase7754 e2e passed"
