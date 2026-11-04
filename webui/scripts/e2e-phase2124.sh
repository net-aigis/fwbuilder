#!/usr/bin/env bash
# Phase-2124: STATUS mentions surface_changelog sessionStorage / 2121-2128.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'surface_changelog.*session|session.*surface_changelog|honestySurfaceChangelog' webui/STATUS.md
grep -qE 'phase2128|through 2128|e2e-phase2128' webui/STATUS.md
echo "STATUS surface_changelog sessionStorage ok"
echo "cleaned"
echo "OK: phase2124 e2e passed"
