#!/usr/bin/env bash
# Phase-779: client types for with_size_policy_minimum sample.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
awk '/export function fetchHardGaps\(/,/^}/' webui/frontend/src/api/client.ts | grep -Fq 'layout_fidelity_sample_with_size_policy_minimum'
awk '/export function fetchHardGapsSummary/,/^}/' webui/frontend/src/api/client.ts | grep -Fq 'layout_fidelity_sample_with_size_policy_minimum'
echo "client minimum sample types ok"
echo "cleaned"
echo "OK: phase779 e2e passed"
