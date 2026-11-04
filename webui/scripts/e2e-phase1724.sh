#!/usr/bin/env bash
# Phase-1724: STATUS mentions surface version / 1721-1728.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'surface.?version|honesty_surface_version|schema 1\.0' webui/STATUS.md
grep -qE 'phase1728|through 1728|e2e-phase1728' webui/STATUS.md
echo "STATUS surface version ok"
echo "cleaned"
echo "OK: phase1724 e2e passed"
