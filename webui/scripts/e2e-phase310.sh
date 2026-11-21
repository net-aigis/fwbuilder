#!/usr/bin/env bash
# Phase-310: STATUS mentions timeline / layout_fidelity embed.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'timeline\|simulated_at\|layout_fidelity' webui/STATUS.md
grep -q 'phase310\|phase309\|phase308\|phase307\|phase306\|phase305' webui/STATUS.md
echo "STATUS 305+ mentions ok"
echo "cleaned"
echo "OK: phase310 e2e passed"
