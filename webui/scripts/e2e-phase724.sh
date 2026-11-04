#!/usr/bin/env bash
# Phase-724: STATUS mentions hard-gaps spacer sample 721-728.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'layout_fidelity_sample_spacers|sample_spacers_with_size_type' webui/STATUS.md
grep -qE 'phase728|through 728|e2e-phase728' webui/STATUS.md
echo "STATUS 721-728 ok"
echo "cleaned"
echo "OK: phase724 e2e passed"
