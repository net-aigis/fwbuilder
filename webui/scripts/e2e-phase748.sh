#!/usr/bin/env bash
# Phase-748: STATUS mentions Minimum/Preferred CSS 745-752.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'size-h-Minimum|size-h-Preferred|Minimum/Preferred' webui/STATUS.md
grep -qE 'phase752|through 752|e2e-phase752' webui/STATUS.md
echo "STATUS 745-752 ok"
echo "cleaned"
echo "OK: phase748 e2e passed"
