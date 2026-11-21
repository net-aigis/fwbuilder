#!/usr/bin/env bash
# Phase-1708: STATUS mentions session_storage_clear export/bundle / 1705-1712.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'session_storage_clear.*(export|bundle)|(export|bundle).*session_storage_clear' webui/STATUS.md
grep -qE 'phase1712|through 1712|e2e-phase1712' webui/STATUS.md
echo "STATUS session_storage_clear export/bundle ok"
echo "cleaned"
echo "OK: phase1708 e2e passed"
