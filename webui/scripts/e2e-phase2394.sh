#!/usr/bin/env bash
# Phase-2394: UI honesty bundle includes honesty_path_roster section.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honesty_path_roster:' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'soft_fertig_honesty_path_roster:' webui/frontend/src/components/FirewallExtras.tsx
echo "UI honesty_path_roster bundle section ok"
echo "cleaned"
echo "OK: phase2394 e2e passed"
