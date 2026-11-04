#!/usr/bin/env bash
# Phase-1323: client related refusal types present.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'hard_gap_related_refusals?:' webui/frontend/src/api/client.ts
echo "client related refusals type ok"
echo "cleaned"
echo "OK: phase1323 e2e passed"
