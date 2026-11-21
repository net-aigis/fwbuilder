#!/usr/bin/env bash
# Phase-1107: client types for alt2 sample.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
python3 - <<'PY'
from pathlib import Path
text = Path("webui/frontend/src/api/client.ts").read_text()

def slice_fn(name: str) -> str:
    start = text.find(f"export function {name}")
    assert start >= 0, name
    end = text.find("\n}", start)
    assert end > start, name
    return text[start : end + 2]

for key in (
    "layout_fidelity_alt2_sample_platform?:",
    "layout_fidelity_alt2_sample_with_enabled?:",
):
    assert key in slice_fn("fetchHardGaps"), key
    assert key in slice_fn("fetchHardGapsSummary"), key
print("client types ok")
PY
echo "client alt2 sample types ok"
echo "cleaned"
echo "OK: phase1107 e2e passed"
