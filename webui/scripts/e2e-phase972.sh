#!/usr/bin/env bash
# Phase-972: STATUS mentions spacers_with_size_hint / 969-976.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'spacers_with_size_hint|sizeHint=|layout_fidelity_sample_spacers_with_size_hint' webui/STATUS.md
grep -qE 'phase976|through 976|e2e-phase976' webui/STATUS.md
echo "STATUS spacers_with_size_hint ok"
echo "cleaned"
echo "OK: phase972 e2e passed"
