#!/usr/bin/env bash
# Phase-1292: STATUS mentions related refusals detail / 1289-1296.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'Related hard-gap refusals|related refusals (detail|expandable)' webui/STATUS.md
grep -qE 'phase1296|through 1296|e2e-phase1296' webui/STATUS.md
echo "STATUS related refusals detail ok"
echo "cleaned"
echo "OK: phase1292 e2e passed"
