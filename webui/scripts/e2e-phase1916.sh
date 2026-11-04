#!/usr/bin/env bash
# Phase-1916: STATUS mentions readiness export/bundle / 1913-1920.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'readiness.*(export|bundle)|(export|bundle).*readiness' webui/STATUS.md
grep -qE 'phase1920|through 1920|e2e-phase1920' webui/STATUS.md
echo "STATUS readiness export/bundle ok"
echo "cleaned"
echo "OK: phase1916 e2e passed"
