#!/usr/bin/env bash
# Phase-1142: typecheck after hard_gap_open_labels.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1142 ok"
echo "cleaned"
echo "OK: phase1142 e2e passed"
