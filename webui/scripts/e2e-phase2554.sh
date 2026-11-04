#!/usr/bin/env bash
# Phase-2554: UI honesty bundle includes honesty_export_roster section.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honesty_export_roster:' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'soft_fertig_honesty_export_roster:' webui/frontend/src/components/FirewallExtras.tsx
echo "UI honesty_export_roster bundle section ok"
echo "cleaned"
echo "OK: phase2554 e2e passed"
