#!/usr/bin/env bash
# Phase-374: STATUS documents stack_switch 369–376.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'phase369\|e2e-phase369' webui/STATUS.md
grep -q 'phase376\|e2e-phase376' webui/STATUS.md
grep -qi 'stack_switch\|device-type\|use_ULOG' webui/STATUS.md
echo "STATUS 369-376 ok"
echo "cleaned"
echo "OK: phase374 e2e passed"
