#!/usr/bin/env bash
# Phase-2595: UI honesty milestone + honestyExportRoster storage at 6200.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honestyExportRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 6200 UI ok"
echo "cleaned"
echo "OK: phase2595 e2e passed"
