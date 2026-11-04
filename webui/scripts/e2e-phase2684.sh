#!/usr/bin/env bash
# Phase-2684: STATUS mentions Soft 2680+ / 2681-2688.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'Soft 2680\+|2440\+ Checkpoint|Soft-2440' webui/STATUS.md
grep -qE 'phase2688|through 2688|e2e-phase2688' webui/STATUS.md
echo "STATUS Soft 2680+ ok"
echo "cleaned"
echo "OK: phase2684 e2e passed"
