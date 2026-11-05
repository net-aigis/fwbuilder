#!/usr/bin/env bash
# Phase-3196: STATUS mentions layout_fidelity_sample_field_roster export / 3193-3200.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'layout_fidelity_sample_field_roster.*(export|bundle)|export.*layout_fidelity_sample_field_roster|bundle.*layout_fidelity_sample_field_roster' webui/STATUS.md
grep -qE 'phase3200|through 3200|e2e-phase3200' webui/STATUS.md
echo "STATUS layout_fidelity_sample_field_roster export ok"
echo "cleaned"
echo "OK: phase3196 e2e passed"
