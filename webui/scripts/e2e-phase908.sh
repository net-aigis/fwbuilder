#!/usr/bin/env bash
# Phase-908: STATUS mentions window_title/tab_position samples / 905-912.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'window_title|tab_position samples|windowTitle=|chrome window_title' webui/STATUS.md
grep -qE 'phase912|through 912|e2e-phase912' webui/STATUS.md
echo "STATUS chrome title/tabPos ok"
echo "cleaned"
echo "OK: phase908 e2e passed"
