#!/usr/bin/env bash
# Phase-1900: STATUS mentions honesty readiness / 1897-1904.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'honesty_readiness|readiness' webui/STATUS.md
grep -qE 'phase1904|through 1904|e2e-phase1904' webui/STATUS.md
echo "STATUS honesty readiness ok"
echo "cleaned"
echo "OK: phase1900 e2e passed"
