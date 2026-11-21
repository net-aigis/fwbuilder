#!/usr/bin/env bash
# Phase-420: STATUS documents ipt option_enable 417–424.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'phase417\|e2e-phase417' webui/STATUS.md
grep -q 'phase424\|e2e-phase424' webui/STATUS.md
grep -qi 'ulog_cprange\|option_enable.*LOG\|LOG/ULOG' webui/STATUS.md
echo "STATUS 417-424 ok"
echo "cleaned"
echo "OK: phase420 e2e passed"
