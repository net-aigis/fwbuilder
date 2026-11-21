#!/usr/bin/env bash
# Phase-613: client types for closure honesty fields + honesty_paths.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honesty_paths?' webui/frontend/src/api/client.ts
grep -Fq 'soft_fertig_honesty_track?' webui/frontend/src/api/client.ts
# closure fetchHardGapClosure should mention honesty_milestone
awk '/export function fetchHardGapClosure/,/^}/' webui/frontend/src/api/client.ts | grep -Fq 'honesty_milestone'
echo "client honesty types ok"
echo "cleaned"
echo "OK: phase613 e2e passed"
