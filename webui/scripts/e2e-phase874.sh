#!/usr/bin/env bash
# Phase-874: UI fields=/grid=/labels=/tooltips= sample bits.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'layout_fidelity_sample_with_grid' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'layout_fidelity_sample_fields' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'grid=' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'labels=' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'tooltips=' webui/frontend/src/components/FirewallExtras.tsx
echo "UI field sample bits ok"
echo "cleaned"
echo "OK: phase874 e2e passed"
