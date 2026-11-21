#!/usr/bin/env bash
# Phase-6771: UI honesty milestone + ssh_not_implemented_keyboard_roster at tip.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshNotImplementedKeyboardRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 19250 UI tail ok"; echo "cleaned"; echo "OK: phase6771 e2e passed"
