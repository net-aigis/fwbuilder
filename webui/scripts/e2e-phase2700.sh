#!/usr/bin/env bash
# Phase-2700: STATUS mentions surface roster / 2697-2704.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'surface_roster|surface roster' webui/STATUS.md
grep -qE 'phase2704|through 2704|e2e-phase2704' webui/STATUS.md
echo "STATUS surface roster ok"
echo "cleaned"
echo "OK: phase2700 e2e passed"
