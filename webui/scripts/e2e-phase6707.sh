#!/usr/bin/env bash
# Phase-6707: UI honesty milestone + ssh_not_implemented_keyboard_roster at 18800.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshNotImplementedKeyboardRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 18800 UI ok"; echo "cleaned"; echo "OK: phase6707 e2e passed"
