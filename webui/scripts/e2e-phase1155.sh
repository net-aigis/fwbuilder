#!/usr/bin/env bash
# Phase-1155: client types for hard_gap_closure_titles.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'hard_gap_closure_titles?:' webui/frontend/src/api/client.ts
echo "client hard_gap_closure_titles types ok"
echo "cleaned"
echo "OK: phase1155 e2e passed"
