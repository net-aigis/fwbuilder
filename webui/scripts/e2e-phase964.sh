#!/usr/bin/env bash
# Phase-964: STATUS mentions with_visible / 961-968.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'with_visible|visible=|layout_fidelity_sample_with_visible' webui/STATUS.md
grep -qE 'phase968|through 968|e2e-phase968' webui/STATUS.md
echo "STATUS with_visible ok"
echo "cleaned"
echo "OK: phase964 e2e passed"
