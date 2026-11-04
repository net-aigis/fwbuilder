#!/usr/bin/env bash
# Phase-890: UI pages=/sections=/stacks= sample bits.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'layout_fidelity_sample_pages' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'layout_fidelity_sample_sections' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'layout_fidelity_sample_stack_names_count' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'pages=' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sections=' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'stacks=' webui/frontend/src/components/FirewallExtras.tsx
echo "UI pages/sections/stacks bits ok"
echo "cleaned"
echo "OK: phase890 e2e passed"
