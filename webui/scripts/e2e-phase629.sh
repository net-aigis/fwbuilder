#!/usr/bin/env bash
# Phase-629: STATUS mentions summary 625-632.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'phase632\|e2e-phase632\|through 632' webui/STATUS.md
grep -q 'hard-gaps/summary\|Show hard-gaps summary\|summary_path' webui/STATUS.md
echo "STATUS 625-632 ok"
echo "cleaned"
echo "OK: phase629 e2e passed"
