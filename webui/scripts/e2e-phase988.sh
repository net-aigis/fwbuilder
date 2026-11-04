#!/usr/bin/env bash
# Phase-988: STATUS mentions with_whats_this / 985-992.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'with_whats_this|whatsThis=|layout_fidelity_sample_with_whats_this' webui/STATUS.md
grep -qE 'phase992|through 992|e2e-phase992' webui/STATUS.md
echo "STATUS with_whats_this ok"
echo "cleaned"
echo "OK: phase988 e2e passed"
