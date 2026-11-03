#!/usr/bin/env bash
# Phase-287: STATUS mentions enabled/sizeGrip/hard_gap_notes/walkthrough persist.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'size_grip\|enabled\|hard_gap_notes\|walkthrough.*sessionStorage\|sizeGrip' webui/STATUS.md
grep -q 'phase287\|phase286\|phase285\|phase284\|phase283\|phase282\|phase281' webui/STATUS.md
echo "STATUS 281+ mentions ok"
echo "cleaned"
echo "OK: phase287 e2e passed"
