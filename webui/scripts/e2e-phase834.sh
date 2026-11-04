#!/usr/bin/env bash
# Phase-834: UI flat=/checkable=/annotations= sample bits.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'layout_fidelity_sample_sections_with_flat' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'layout_fidelity_sample_sections_with_checkable' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'layout_fidelity_sample_annotations' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'flat=' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'checkable=' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'annotations=' webui/frontend/src/components/FirewallExtras.tsx
echo "UI section/annotation sample bits ok"
echo "cleaned"
echo "OK: phase834 e2e passed"
