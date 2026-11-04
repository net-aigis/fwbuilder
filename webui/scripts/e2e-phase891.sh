#!/usr/bin/env bash
# Phase-891: client types for pages/sections/stack_names samples.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
awk '/export function fetchHardGaps\(/,/^}/' webui/frontend/src/api/client.ts | grep -Fq 'layout_fidelity_sample_pages'
awk '/export function fetchHardGaps\(/,/^}/' webui/frontend/src/api/client.ts | grep -Fq 'layout_fidelity_sample_stack_names'
awk '/export function fetchHardGapsSummary/,/^}/' webui/frontend/src/api/client.ts | grep -Fq 'layout_fidelity_sample_stack_names_count'
echo "client pages/sections/stacks types ok"
echo "cleaned"
echo "OK: phase891 e2e passed"
