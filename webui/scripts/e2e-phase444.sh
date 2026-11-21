#!/usr/bin/env bash
# Phase-444: STATUS 441–448.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'phase441\|e2e-phase441' webui/STATUS.md
grep -q 'phase448\|e2e-phase448' webui/STATUS.md
grep -qi 'options.type\|writes_option\|Device type' webui/STATUS.md
echo "STATUS 441-448 ok"
echo "cleaned"
echo "OK: phase444 e2e passed"
