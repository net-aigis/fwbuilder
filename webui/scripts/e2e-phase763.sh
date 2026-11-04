#!/usr/bin/env bash
# Phase-763: client types for with_size_policy_fixed sample.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
awk '/export function fetchHardGaps\(/,/^}/' webui/frontend/src/api/client.ts | grep -Fq 'layout_fidelity_sample_with_size_policy_fixed'
awk '/export function fetchHardGapsSummary/,/^}/' webui/frontend/src/api/client.ts | grep -Fq 'layout_fidelity_sample_with_size_policy_fixed'
echo "client fixed sample types ok"
echo "cleaned"
echo "OK: phase763 e2e passed"
