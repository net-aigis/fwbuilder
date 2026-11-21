#!/usr/bin/env bash
# Phase-1388: STATUS mentions closure honesty_paths / 1385-1392.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'honesty_paths.*(closure)|closure.*honesty_paths' webui/STATUS.md
grep -qE 'phase1392|through 1392|e2e-phase1392' webui/STATUS.md
echo "STATUS closure honesty_paths ok"
echo "cleaned"
echo "OK: phase1388 e2e passed"
