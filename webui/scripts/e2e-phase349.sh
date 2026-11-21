#!/usr/bin/env bash
# Phase-349: STATUS mentions QStackedWidget / stacked.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'QStackedWidget\|stacked' webui/STATUS.md
grep -q 'phase349\|phase348\|phase347\|phase346\|phase345' webui/STATUS.md
echo "STATUS stacked mentions ok"
echo "cleaned"
echo "OK: phase349 e2e passed"
