#!/usr/bin/env bash
# Phase-1003: client types for with_enabled.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
awk '/export function fetchHardGaps\(/,/^}/' webui/frontend/src/api/client.ts | grep -Fq 'layout_fidelity_sample_with_enabled?:'
awk '/export function fetchHardGapsSummary/,/^}/' webui/frontend/src/api/client.ts | grep -Fq 'layout_fidelity_sample_with_enabled?:'
echo "client with_enabled types ok"
echo "cleaned"
echo "OK: phase1003 e2e passed"
