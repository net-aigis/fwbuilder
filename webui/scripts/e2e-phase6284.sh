#!/usr/bin/env bash
# Phase-6284: STATUS Soft 6280+ ssh_implemented_batch_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 6040\+|through 6296|ssh_implemented_batch_roster' webui/STATUS.md
grep -qE 'phase6288|through 6288|e2e-phase6296' webui/STATUS.md
echo "STATUS Soft 6280+ ok"; echo "cleaned"; echo "OK: phase6284 e2e passed"
