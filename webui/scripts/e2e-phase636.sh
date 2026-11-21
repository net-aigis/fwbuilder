#!/usr/bin/env bash
# Phase-636: STATUS mentions sample fidelity 633-640.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'phase640\|e2e-phase640\|through 640' webui/STATUS.md
grep -q 'layout_fidelity_sample\|sample fidelity\|Sample fidelity' webui/STATUS.md
echo "STATUS 633-640 ok"
echo "cleaned"
echo "OK: phase636 e2e passed"
