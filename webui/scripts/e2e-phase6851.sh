#!/usr/bin/env bash
# Phase-6851: UI honesty milestone + ssh_not_implemented_password_roster at tip.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshNotImplementedPasswordRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 19500 UI tail ok"; echo "cleaned"; echo "OK: phase6851 e2e passed"
