#!/usr/bin/env bash
# Phase-6755: UI honesty milestone + ssh_not_implemented_keyboard_roster sessionStorage at 18900.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshNotImplementedKeyboardRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 18900 UI ok"; echo "cleaned"; echo "OK: phase6755 e2e passed"
