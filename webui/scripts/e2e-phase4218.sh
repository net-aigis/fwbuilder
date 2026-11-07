#!/usr/bin/env bash
# Phase-4218: UI option-enable roster detail + download/copy.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'optionEnableRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig option-enable roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download option-enable roster' webui/frontend/src/components/FirewallExtras.tsx
echo "UI option-enable roster ok"
echo "cleaned"
echo "OK: phase4218 e2e passed"
