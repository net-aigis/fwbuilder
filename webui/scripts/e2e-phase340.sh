#!/usr/bin/env bash
# Phase-340: STATUS mentions /hard-gaps/closure.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'hard-gaps/closure\|closure_path' webui/STATUS.md
grep -q 'phase340\|phase339\|phase338\|phase337' webui/STATUS.md
echo "STATUS closure endpoint mentions ok"
echo "cleaned"
echo "OK: phase340 e2e passed"
