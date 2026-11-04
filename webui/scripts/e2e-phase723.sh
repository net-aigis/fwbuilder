#!/usr/bin/env bash
# Phase-723: client /hard-gaps spacer sample types.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
awk '/export function fetchHardGaps\(/,/^}/' webui/frontend/src/api/client.ts | grep -Fq 'layout_fidelity_sample_spacers'
awk '/export function fetchHardGaps\(/,/^}/' webui/frontend/src/api/client.ts | grep -Fq 'layout_fidelity_sample_spacers_with_size_type'
echo "client hard-gaps spacer types ok"
echo "cleaned"
echo "OK: phase723 e2e passed"
