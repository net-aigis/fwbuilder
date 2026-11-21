#!/usr/bin/env bash
# Phase-811: client types for with_size_policy_preferred sample.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
awk '/export function fetchHardGaps\(/,/^}/' webui/frontend/src/api/client.ts | grep -Fq 'layout_fidelity_sample_with_size_policy_preferred'
awk '/export function fetchHardGapsSummary/,/^}/' webui/frontend/src/api/client.ts | grep -Fq 'layout_fidelity_sample_with_size_policy_preferred'
echo "client preferred sample types ok"
echo "cleaned"
echo "OK: phase811 e2e passed"
