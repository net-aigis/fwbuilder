#!/usr/bin/env bash
# Phase-876: STATUS mentions grid/label/tooltip samples / 873-880.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'with_grid|grid/label|fields=/grid=|with_grid/label/tooltip' webui/STATUS.md
grep -qE 'phase880|through 880|e2e-phase880' webui/STATUS.md
echo "STATUS field samples ok"
echo "cleaned"
echo "OK: phase876 e2e passed"
