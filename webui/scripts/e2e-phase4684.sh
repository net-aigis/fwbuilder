#!/usr/bin/env bash
# Phase-4684: STATUS mentions Soft 4680+ / 4681-4688.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'Soft 4680\+|4680\+ Checkpoint|Soft-4680' webui/STATUS.md
grep -qE 'phase4688|through 4688|e2e-phase4688' webui/STATUS.md
echo "STATUS Soft 4680+ ok"
echo "cleaned"
echo "OK: phase4684 e2e passed"
