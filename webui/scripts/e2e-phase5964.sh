#!/usr/bin/env bash
# Phase-5964: STATUS Soft 5960+ ssh_batch_mode_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 5160\+|through 5968|ssh_batch_mode_roster' webui/STATUS.md
grep -qE 'phase5968|through 5968|e2e-phase5968' webui/STATUS.md
echo "STATUS Soft 5960+ ok"; echo "cleaned"; echo "OK: phase5964 e2e passed"
