#!/usr/bin/env bash
# Phase-843: STATUS mentions min/max size score weights / 841-848.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'score weights|with_minimum_size.*score|min/max size score' webui/STATUS.md
grep -qE 'phase848|through 848|e2e-phase848' webui/STATUS.md
echo "STATUS min/max score weights ok"
echo "cleaned"
echo "OK: phase843 e2e passed"
