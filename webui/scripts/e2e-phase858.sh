#!/usr/bin/env bash
# Phase-858: UI colStretch=/spacing=/layoutTree=/geometry=/sizeGrip= bits.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'layout_fidelity_sample_pages_with_column_stretch' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'layout_fidelity_sample_chrome_geometry' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'colStretch=' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'geometry=' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sizeGrip=' webui/frontend/src/components/FirewallExtras.tsx
echo "UI stretch/chrome sample bits ok"
echo "cleaned"
echo "OK: phase858 e2e passed"
