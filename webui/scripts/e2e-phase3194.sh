#!/usr/bin/env bash
# Phase-3194: UI honesty bundle includes layout_fidelity_sample_field_roster section.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'layout_fidelity_sample_field_roster:' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'soft_fertig_layout_fidelity_sample_field_roster:' webui/frontend/src/components/FirewallExtras.tsx
echo "UI layout_fidelity_sample_field_roster bundle section ok"
echo "cleaned"
echo "OK: phase3194 e2e passed"
