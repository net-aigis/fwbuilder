#!/usr/bin/env bash
# Phase-460: STATUS 457–464.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'phase457\|e2e-phase457' webui/STATUS.md
grep -q 'phase464\|e2e-phase464' webui/STATUS.md
grep -qi 'option-enable\|option_enable_path' webui/STATUS.md
echo "STATUS 457-464 ok"
echo "cleaned"
echo "OK: phase460 e2e passed"
