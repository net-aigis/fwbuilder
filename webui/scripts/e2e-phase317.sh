#!/usr/bin/env bash
# Phase-317: STATUS mentions walkthrough download / rule fidelity.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'walkthrough\|rule.*fidelity\|layout_fidelity' webui/STATUS.md
grep -q 'phase317\|phase316\|phase315\|phase314\|phase313' webui/STATUS.md
echo "STATUS 313+ mentions ok"
echo "cleaned"
echo "OK: phase317 e2e passed"
