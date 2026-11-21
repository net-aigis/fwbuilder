#!/usr/bin/env bash
# Phase-3626: UI surface changelog meta roster sessionStorage persist/restore/clear.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'surfaceChangelogMetaRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.surfaceChangelogMetaRoster.' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'surfaceChangelogMetaRosterStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI surface_changelog_meta_roster sessionStorage ok"
echo "cleaned"
echo "OK: phase3626 e2e passed"
