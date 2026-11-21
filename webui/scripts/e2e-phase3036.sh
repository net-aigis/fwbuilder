#!/usr/bin/env bash
# Phase-3036: STATUS mentions layout_fidelity_signal_roster export / 3033-3040.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'layout_fidelity_signal_roster.*(export|bundle)|export.*layout_fidelity_signal_roster|bundle.*layout_fidelity_signal_roster' webui/STATUS.md
grep -qE 'phase3040|through 3040|e2e-phase3040' webui/STATUS.md
echo "STATUS layout_fidelity_signal_roster export ok"
echo "cleaned"
echo "OK: phase3036 e2e passed"
