#!/usr/bin/env bash
# Phase-1051: client types for with_external_label.
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

assert "layout_fidelity_sample_with_external_label?:" in slice_fn("fetchHardGaps")
assert "layout_fidelity_sample_with_external_label?:" in slice_fn("fetchHardGapsSummary")
print("client types ok")
PY
echo "client with_external_label types ok"
echo "cleaned"
echo "OK: phase1051 e2e passed"
