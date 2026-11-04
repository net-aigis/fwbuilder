#!/usr/bin/env bash
# Phase-1252: STATUS mentions hard_gap_related_refusals / 1249-1256.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'hard_gap_related_refusals|related refusal' webui/STATUS.md
grep -qE 'phase1256|through 1256|e2e-phase1256' webui/STATUS.md
echo "STATUS related refusals ok"
echo "cleaned"
echo "OK: phase1252 e2e passed"
