#!/usr/bin/env bash
# Phase-1836: STATUS mentions track_note export/bundle / 1833-1840.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'track_note.*(export|bundle)|(export|bundle).*track_note' webui/STATUS.md
grep -qE 'phase1840|through 1840|e2e-phase1840' webui/STATUS.md
echo "STATUS track_note export/bundle ok"
echo "cleaned"
echo "OK: phase1836 e2e passed"
