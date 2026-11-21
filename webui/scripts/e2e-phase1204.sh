#!/usr/bin/env bash
# Phase-1204: STATUS mentions honesty_path_titles / 1201-1208.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'honesty_path_titles|honesty path titles' webui/STATUS.md
grep -qE 'phase1208|through 1208|e2e-phase1208' webui/STATUS.md
echo "STATUS honesty_path_titles ok"
echo "cleaned"
echo "OK: phase1204 e2e passed"
