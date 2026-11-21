#!/usr/bin/env bash
# Phase-1644: STATUS mentions honesty_bundle session/export / 1641-1648.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'honesty_bundle.*(session|export)|session.*honesty_bundle|export.*honesty_bundle' webui/STATUS.md
grep -qE 'phase1648|through 1648|e2e-phase1648' webui/STATUS.md
echo "STATUS honesty_bundle catalogs ok"
echo "cleaned"
echo "OK: phase1644 e2e passed"
