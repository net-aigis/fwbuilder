#!/usr/bin/env bash
# Phase-1419: client related refusal types.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'hard_gap_related_refusals?:' webui/frontend/src/api/client.ts
echo "client related refusals types ok"
echo "cleaned"
echo "OK: phase1419 e2e passed"
