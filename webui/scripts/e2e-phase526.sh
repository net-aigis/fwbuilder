#!/usr/bin/env bash
# Phase-526: STATUS 521–528.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'phase521\|e2e-phase521' webui/STATUS.md
grep -q 'phase528\|e2e-phase528' webui/STATUS.md
grep -qi 'signal_catalog\|hard-gaps JSON\|pages_with_buddy_labels' webui/STATUS.md
echo "STATUS 521-528 ok"
echo "cleaned"
echo "OK: phase526 e2e passed"
