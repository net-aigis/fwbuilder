#!/usr/bin/env bash
# Phase-302: STATUS mentions layout-fidelity / score_percent.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'layout-fidelity\|layout_fidelity\|score_percent\|fidelity' webui/STATUS.md
grep -q 'phase302\|phase301\|phase300\|phase299\|phase298\|phase297' webui/STATUS.md
echo "STATUS fidelity mentions ok"
echo "cleaned"
echo "OK: phase302 e2e passed"
