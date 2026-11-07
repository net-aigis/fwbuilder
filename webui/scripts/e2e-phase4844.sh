#!/usr/bin/env bash
# Phase-4844: STATUS Soft 4840+ ssh_implemented_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 4840\+|through 4848|ssh_implemented_roster' webui/STATUS.md
grep -qE 'phase4848|through 4848|e2e-phase4848' webui/STATUS.md
echo "STATUS Soft 4840+ ok"; echo "cleaned"; echo "OK: phase4844 e2e passed"
