#!/usr/bin/env bash
# Phase-1676: STATUS mentions clear in surface / 1673-1680.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'session.?storage.?clear.*(surface|in surface)|surface.*session.?storage.?clear|clear.*surface keys' webui/STATUS.md
grep -qE 'phase1680|through 1680|e2e-phase1680' webui/STATUS.md
echo "STATUS surface+clear ok"
echo "cleaned"
echo "OK: phase1676 e2e passed"
