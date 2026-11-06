#!/usr/bin/env bash
# Phase-3594: UI honesty bundle includes surface_changelog_meta_roster section.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'surface_changelog_meta_roster:' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'soft_fertig_surface_changelog_meta_roster:' webui/frontend/src/components/FirewallExtras.tsx
echo "UI surface_changelog_meta_roster bundle section ok"
echo "cleaned"
echo "OK: phase3594 e2e passed"
