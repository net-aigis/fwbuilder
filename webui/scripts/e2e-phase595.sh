#!/usr/bin/env bash
# Phase-595: STATUS 593–600.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'phase593\|e2e-phase593' webui/STATUS.md
grep -q 'phase600\|e2e-phase600' webui/STATUS.md
grep -qi 'Download refusals\|expectRefusalsKey' webui/STATUS.md
echo "STATUS 593-600 ok"
echo "cleaned"
echo "OK: phase595 e2e passed"
