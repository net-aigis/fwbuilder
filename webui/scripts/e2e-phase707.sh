#!/usr/bin/env bash
# Phase-707: client summary spacer sample types.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
awk '/export function fetchHardGapsSummary/,/^}/' webui/frontend/src/api/client.ts | grep -Fq 'layout_fidelity_sample_spacers'
awk '/export function fetchHardGapsSummary/,/^}/' webui/frontend/src/api/client.ts | grep -Fq 'layout_fidelity_sample_spacers_with_size_type'
echo "client summary spacer types ok"
echo "cleaned"
echo "OK: phase707 e2e passed"
