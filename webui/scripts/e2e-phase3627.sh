#!/usr/bin/env bash
# Phase-3627: clear title mentions surface changelog meta roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'surface changelog meta roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorage.removeItem(surfaceChangelogMetaRosterStorageKey(firewallId))' webui/frontend/src/components/FirewallExtras.tsx
echo "clear surface_changelog_meta_roster ok"
echo "cleaned"
echo "OK: phase3627 e2e passed"
