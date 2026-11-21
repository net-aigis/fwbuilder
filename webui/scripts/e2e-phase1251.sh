#!/usr/bin/env bash
# Phase-1251: client types for hard_gap_related_refusals.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'hard_gap_related_refusals?:' webui/frontend/src/api/client.ts
grep -Fq 'hard_gap_related_refusal_titles?:' webui/frontend/src/api/client.ts
echo "client related refusal types ok"
echo "cleaned"
echo "OK: phase1251 e2e passed"
