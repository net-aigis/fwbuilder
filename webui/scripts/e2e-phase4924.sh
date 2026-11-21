#!/usr/bin/env bash
# Phase-4924: STATUS Soft 4920+ ssh_capability_flags_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 4920\+|through 4928|ssh_capability_flags_roster' webui/STATUS.md
grep -qE 'phase4928|through 4928|e2e-phase4928' webui/STATUS.md
echo "STATUS Soft 4920+ ok"; echo "cleaned"; echo "OK: phase4924 e2e passed"
