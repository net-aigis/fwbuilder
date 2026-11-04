#!/usr/bin/env bash
# Phase-835: client types for flat/checkable/annotations samples.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
awk '/export function fetchHardGaps\(/,/^}/' webui/frontend/src/api/client.ts | grep -Fq 'layout_fidelity_sample_sections_with_flat'
awk '/export function fetchHardGaps\(/,/^}/' webui/frontend/src/api/client.ts | grep -Fq 'layout_fidelity_sample_annotations'
awk '/export function fetchHardGapsSummary/,/^}/' webui/frontend/src/api/client.ts | grep -Fq 'layout_fidelity_sample_sections_with_checkable'
echo "client section/annotation sample types ok"
echo "cleaned"
echo "OK: phase835 e2e passed"
