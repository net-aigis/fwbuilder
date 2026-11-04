#!/usr/bin/env bash
# Phase-2396: STATUS mentions honesty_path_roster export / 2393-2400.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'honesty_path_roster.*(export|bundle)|export.*honesty_path_roster|bundle.*honesty_path_roster' webui/STATUS.md
grep -qE 'phase2400|through 2400|e2e-phase2400' webui/STATUS.md
echo "STATUS honesty_path_roster export ok"
echo "cleaned"
echo "OK: phase2396 e2e passed"
