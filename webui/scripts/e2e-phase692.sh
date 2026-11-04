#!/usr/bin/env bash
# Phase-692: STATUS mentions spacer orientation/size_type 689-696.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'spacers_with_orientation|spacers_with_size_type|size_type' webui/STATUS.md
grep -qE 'phase696|through 696|e2e-phase696' webui/STATUS.md
echo "STATUS 689-696 ok"
echo "cleaned"
echo "OK: phase692 e2e passed"
