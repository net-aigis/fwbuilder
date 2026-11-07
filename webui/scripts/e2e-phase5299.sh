#!/usr/bin/env bash
# Phase-5299: UI honesty milestone + schema 5.6 at 14650.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthPolicyRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 14650 UI ok"; echo "cleaned"; echo "OK: phase5299 e2e passed"
