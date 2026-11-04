#!/usr/bin/env bash
# Phase-2060: STATUS mentions soft-complete note detail/restore / 2057-2064.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'soft.?complete.?note.*(detail|restore|expandable)|(detail|restore|expandable).*soft.?complete' webui/STATUS.md
grep -qE 'phase2064|through 2064|e2e-phase2064' webui/STATUS.md
echo "STATUS soft-complete note detail ok"
echo "cleaned"
echo "OK: phase2060 e2e passed"
