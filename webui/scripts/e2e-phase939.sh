#!/usr/bin/env bash
# Phase-939: client types for with_size_policy total sample.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
awk '/export function fetchHardGaps\(/,/^}/' webui/frontend/src/api/client.ts | grep -Fq 'layout_fidelity_sample_with_size_policy?:'
awk '/export function fetchHardGapsSummary/,/^}/' webui/frontend/src/api/client.ts | grep -Fq 'layout_fidelity_sample_with_size_policy?:'
echo "client sizePolicy total types ok"
echo "cleaned"
echo "OK: phase939 e2e passed"
