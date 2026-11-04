#!/usr/bin/env bash
# Phase-406: STATUS documents tab tooltips 401–408.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'phase401\|e2e-phase401' webui/STATUS.md
grep -q 'phase408\|e2e-phase408' webui/STATUS.md
grep -qi 'tab.*tooltip\|page tooltip\|pages_with_tooltip' webui/STATUS.md
echo "STATUS 401-408 ok"
echo "cleaned"
echo "OK: phase406 e2e passed"
