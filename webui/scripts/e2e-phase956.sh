#!/usr/bin/env bash
# Phase-956: STATUS mentions sample_key_count / 953-960.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'sample_key_count|sampleKeys=|layout_fidelity_sample_key_count' webui/STATUS.md
grep -qE 'phase960|through 960|e2e-phase960' webui/STATUS.md
echo "STATUS sample_key_count ok"
echo "cleaned"
echo "OK: phase956 e2e passed"
