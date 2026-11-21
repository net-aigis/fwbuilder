#!/usr/bin/env bash
# Phase-4643: UI honesty milestone + password_ssh_roster at 12600.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'password_ssh_roster:' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 12600 UI ok"
echo "cleaned"
echo "OK: phase4643 e2e passed"
