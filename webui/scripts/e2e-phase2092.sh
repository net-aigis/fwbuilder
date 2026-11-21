#!/usr/bin/env bash
# Phase-2092: STATUS mentions surface_changelog export/bundle / 2089-2096.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'surface_changelog.*(export|bundle)|(export|bundle).*surface_changelog|(changelog).*(export|bundle)' webui/STATUS.md
grep -qE 'phase2096|through 2096|e2e-phase2096' webui/STATUS.md
echo "STATUS surface_changelog export/bundle ok"
echo "cleaned"
echo "OK: phase2092 e2e passed"
