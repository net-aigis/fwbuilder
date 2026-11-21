#!/usr/bin/env bash
# Phase-1035: client types for pages_with_tooltip.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from pathlib import Path
text = Path('webui/frontend/src/api/client.ts').read_text()
def slice_fn(name):
    start = text.find(f'export function {name}')
    assert start >= 0, name
    # find matching closing brace at column 0 after start
    end = text.find('\n}', start)
    assert end > start, name
    return text[start:end+2]
hg = slice_fn('fetchHardGaps')
hs = slice_fn('fetchHardGapsSummary')
assert 'layout_fidelity_sample_pages_with_tooltip?:' in hg, 'hard-gaps missing layout_fidelity_sample_pages_with_tooltip?:'
assert 'layout_fidelity_sample_pages_with_tooltip?:' in hs, 'summary missing layout_fidelity_sample_pages_with_tooltip?:'
print('client types ok')
PY
echo "client pages_with_tooltip types ok"
echo "cleaned"
echo "OK: phase1035 e2e passed"
