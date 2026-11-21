#!/usr/bin/env bash
# Phase-4234: UI honesty bundle includes option_enable_roster section.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'option_enable_roster:' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'soft_fertig_option_enable_roster:' webui/frontend/src/components/FirewallExtras.tsx
echo "UI option_enable_roster bundle section ok"
echo "cleaned"
echo "OK: phase4234 e2e passed"
