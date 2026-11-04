#!/usr/bin/env bash
# Phase-708: STATUS mentions summary spacers 705-712.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'layout_fidelity_sample_spacers|sample_spacers_with_size_type|spacers_with_size_type' webui/STATUS.md
grep -qE 'phase712|through 712|e2e-phase712' webui/STATUS.md
echo "STATUS 705-712 ok"
echo "cleaned"
echo "OK: phase708 e2e passed"
