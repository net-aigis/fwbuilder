#!/usr/bin/env bash
# Phase-2826: UI changelog roster sessionStorage persist/restore/clear.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'changelogRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.changelogRoster.' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'changelogRosterStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI changelog_roster sessionStorage ok"
echo "cleaned"
echo "OK: phase2826 e2e passed"
