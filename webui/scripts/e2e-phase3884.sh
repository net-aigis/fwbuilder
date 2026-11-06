#!/usr/bin/env bash
# Phase-3884: STATUS mentions Soft 3880+ / 3881-3888.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'Soft 3880\+|3880\+ Checkpoint|Soft-3880' webui/STATUS.md
grep -qE 'phase3888|through 3888|e2e-phase3888' webui/STATUS.md
echo "STATUS Soft 3880+ ok"
echo "cleaned"
echo "OK: phase3884 e2e passed"
