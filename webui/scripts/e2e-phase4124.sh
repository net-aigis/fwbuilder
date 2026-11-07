#!/usr/bin/env bash
# Phase-4124: STATUS mentions Soft 4120+ / 4121-4128.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'Soft 4120\+|4120\+ Checkpoint|Soft-4120' webui/STATUS.md
grep -qE 'phase4128|through 4128|e2e-phase4128' webui/STATUS.md
echo "STATUS Soft 4120+ ok"
echo "cleaned"
echo "OK: phase4124 e2e passed"
