#!/usr/bin/env bash
# Phase-3116: STATUS mentions layout_fidelity_sample_roster export / 3113-3120.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'layout_fidelity_sample_roster.*(export|bundle)|export.*layout_fidelity_sample_roster|bundle.*layout_fidelity_sample_roster' webui/STATUS.md
grep -qE 'phase3120|through 3120|e2e-phase3120' webui/STATUS.md
echo "STATUS layout_fidelity_sample_roster export ok"
echo "cleaned"
echo "OK: phase3116 e2e passed"
