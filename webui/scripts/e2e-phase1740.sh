#!/usr/bin/env bash
# Phase-1740: STATUS mentions surface_version export/bundle / 1737-1744.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'surface_version.*(export|bundle)|(export|bundle).*surface_version' webui/STATUS.md
grep -qE 'phase1744|through 1744|e2e-phase1744' webui/STATUS.md
echo "STATUS surface_version export/bundle ok"
echo "cleaned"
echo "OK: phase1740 e2e passed"
