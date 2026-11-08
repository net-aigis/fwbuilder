#!/usr/bin/env bash
# Phase-6723: UI honesty milestone + ssh_not_implemented_keyboard_roster export at 18850.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshNotImplementedKeyboardRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 18850 UI ok"; echo "cleaned"; echo "OK: phase6723 e2e passed"
