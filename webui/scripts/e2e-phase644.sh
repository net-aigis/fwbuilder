#!/usr/bin/env bash
# Phase-644: STATUS mentions 641-648 sample on hard-gaps.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'phase648\|e2e-phase648\|through 648' webui/STATUS.md
grep -q 'layout_fidelity_sample' webui/STATUS.md
echo "STATUS 641-648 ok"
echo "cleaned"
echo "OK: phase644 e2e passed"
