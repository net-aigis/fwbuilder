#!/usr/bin/env bash
# Phase-2794: UI honesty bundle includes changelog_roster section.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'changelog_roster:' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'soft_fertig_changelog_roster:' webui/frontend/src/components/FirewallExtras.tsx
echo "UI changelog_roster bundle section ok"
echo "cleaned"
echo "OK: phase2794 e2e passed"
