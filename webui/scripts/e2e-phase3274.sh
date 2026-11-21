#!/usr/bin/env bash
# Phase-3274: UI honesty bundle includes catalog_summary_roster section.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'catalog_summary_roster:' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'soft_fertig_catalog_summary_roster:' webui/frontend/src/components/FirewallExtras.tsx
echo "UI catalog_summary_roster bundle section ok"
echo "cleaned"
echo "OK: phase3274 e2e passed"
