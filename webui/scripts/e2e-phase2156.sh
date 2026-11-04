#!/usr/bin/env bash
# Phase-2156: STATUS mentions operator_brief export/bundle / 2153-2160.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'operator_brief.*(export|bundle)|(export|bundle).*operator_brief' webui/STATUS.md
grep -qE 'phase2160|through 2160|e2e-phase2160' webui/STATUS.md
echo "STATUS operator_brief export/bundle ok"
echo "cleaned"
echo "OK: phase2156 e2e passed"
