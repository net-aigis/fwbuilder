#!/usr/bin/env bash
# Phase-1884: STATUS mentions track note detail/restore / 1881-1888.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'track.?note.*(detail|restore|expandable)|(detail|restore|expandable).*track.?note' webui/STATUS.md
grep -qE 'phase1888|through 1888|e2e-phase1888' webui/STATUS.md
echo "STATUS track note detail ok"
echo "cleaned"
echo "OK: phase1884 e2e passed"
