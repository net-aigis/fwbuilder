#!/usr/bin/env bash
# Phase-971: client types for spacers_with_size_hint.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
awk '/export function fetchHardGaps\(/,/^}/' webui/frontend/src/api/client.ts | grep -Fq 'layout_fidelity_sample_spacers_with_size_hint?:'
awk '/export function fetchHardGapsSummary/,/^}/' webui/frontend/src/api/client.ts | grep -Fq 'layout_fidelity_sample_spacers_with_size_hint?:'
echo "client spacers_with_size_hint types ok"
echo "cleaned"
echo "OK: phase971 e2e passed"
