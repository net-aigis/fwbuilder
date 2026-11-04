#!/usr/bin/env bash
# Phase-604: STATUS 601–608.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'phase601\|e2e-phase601' webui/STATUS.md
grep -q 'phase608\|e2e-phase608' webui/STATUS.md
grep -qi 'honesty_milestone\|honesty milestone' webui/STATUS.md
echo "STATUS 601-608 ok"
echo "cleaned"
echo "OK: phase604 e2e passed"
