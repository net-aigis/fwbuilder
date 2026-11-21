#!/usr/bin/env bash
# Phase-2188: STATUS mentions operator_brief sessionStorage / 2185-2192.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'operator_brief.*session|session.*operator_brief|honestyOperatorBrief' webui/STATUS.md
grep -qE 'phase2192|through 2192|e2e-phase2192' webui/STATUS.md
echo "STATUS operator_brief sessionStorage ok"
echo "cleaned"
echo "OK: phase2188 e2e passed"
