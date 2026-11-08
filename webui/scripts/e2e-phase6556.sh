#!/usr/bin/env bash
# Phase-6556: STATUS mentions ssh_honesty_refresh_roster export / 5113-5120.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_honesty_refresh_roster.*(export|bundle)|Export.*ssh_honesty_refresh_roster' webui/STATUS.md
grep -qE 'phase6560|through 6560|e2e-phase6560' webui/STATUS.md
echo "STATUS ssh_honesty_refresh_roster export ok"; echo "cleaned"; echo "OK: phase6556 e2e passed"
