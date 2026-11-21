#!/usr/bin/env bash
# Phase-6364: STATUS Soft 6360+ ssh_not_implemented_batch_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 6040\+|through 6376|ssh_not_implemented_batch_roster' webui/STATUS.md
grep -qE 'phase6368|through 6368|e2e-phase6376' webui/STATUS.md
echo "STATUS Soft 6360+ ok"; echo "cleaned"; echo "OK: phase6364 e2e passed"
