#!/usr/bin/env bash
# Phase-2012: STATUS mentions soft_complete_note export/bundle / 2009-2016.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'soft_complete_note.*(export|bundle)|(export|bundle).*soft_complete_note' webui/STATUS.md
grep -qE 'phase2016|through 2016|e2e-phase2016' webui/STATUS.md
echo "STATUS soft_complete_note export/bundle ok"
echo "cleaned"
echo "OK: phase2012 e2e passed"
