#!/usr/bin/env bash
# Phase-1020: STATUS mentions with_read_only / 1017-1024.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'with_read_only|readOnly=|layout_fidelity_sample_with_read_only' webui/STATUS.md
grep -qE 'phase1024|through 1024|e2e-phase1024' webui/STATUS.md
echo "STATUS with_read_only ok"
echo "cleaned"
echo "OK: phase1020 e2e passed"
