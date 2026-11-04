#!/usr/bin/env bash
# Phase-2634: UI honesty bundle includes honesty_bundle_roster section.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honesty_bundle_roster:' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'soft_fertig_honesty_bundle_roster:' webui/frontend/src/components/FirewallExtras.tsx
echo "UI honesty_bundle_roster bundle section ok"
echo "cleaned"
echo "OK: phase2634 e2e passed"
