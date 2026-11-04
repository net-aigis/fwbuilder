#!/usr/bin/env bash
# Phase-2380: STATUS mentions honesty path roster / 2377-2384.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'honesty_path_roster|honesty path roster' webui/STATUS.md
grep -qE 'phase2384|through 2384|e2e-phase2384' webui/STATUS.md
echo "STATUS honesty path roster ok"
echo "cleaned"
echo "OK: phase2380 e2e passed"
