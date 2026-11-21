#!/usr/bin/env bash
# Phase-836: STATUS mentions flat/checkable/annotations / 833-840.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'sections_with_flat|sections_with_checkable|annotations samples|flat=' webui/STATUS.md
grep -qE 'phase840|through 840|e2e-phase840' webui/STATUS.md
echo "STATUS section/annotation ok"
echo "cleaned"
echo "OK: phase836 e2e passed"
