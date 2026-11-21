#!/usr/bin/env bash
# Phase-2827: clear title mentions changelog roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'changelog roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorage.removeItem(changelogRosterStorageKey(firewallId))' webui/frontend/src/components/FirewallExtras.tsx
echo "clear changelog_roster ok"
echo "cleaned"
echo "OK: phase2827 e2e passed"
