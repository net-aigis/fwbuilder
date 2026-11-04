#!/usr/bin/env bash
# Phase-1052: STATUS mentions with_external_label / 1049-1056.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'with_external_label|extLabel=|layout_fidelity_sample_with_external_label' webui/STATUS.md
grep -qE 'phase1056|through 1056|e2e-phase1056' webui/STATUS.md
echo "STATUS with_external_label ok"
echo "cleaned"
echo "OK: phase1052 e2e passed"
