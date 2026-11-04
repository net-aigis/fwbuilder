#!/usr/bin/env bash
# Phase-987: client types for with_whats_this.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
awk '/export function fetchHardGaps\(/,/^}/' webui/frontend/src/api/client.ts | grep -Fq 'layout_fidelity_sample_with_whats_this?:'
awk '/export function fetchHardGapsSummary/,/^}/' webui/frontend/src/api/client.ts | grep -Fq 'layout_fidelity_sample_with_whats_this?:'
echo "client with_whats_this types ok"
echo "cleaned"
echo "OK: phase987 e2e passed"
