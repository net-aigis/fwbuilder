#!/usr/bin/env bash
# Phase-860: STATUS mentions stretch/chrome samples / 857-864.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'column_stretch|pages_with_spacing|chrome geometry|size_grip|colStretch=|stretch/spacing/chrome|chrome hard-gaps' webui/STATUS.md
grep -qE 'phase864|through 864|e2e-phase864' webui/STATUS.md
# keep honesty note keywords visible in STATUS track table
grep -Fq 'stretch/spacing/chrome hard-gaps sample' webui/STATUS.md
echo "STATUS stretch/chrome ok"
echo "cleaned"
echo "OK: phase860 e2e passed"
