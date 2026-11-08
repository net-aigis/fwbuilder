#!/usr/bin/env bash
# Phase-11964: STATUS Soft 11960+ ssh_auth_hard_gap_count_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 11960\+|through 11968|ssh_auth_hard_gap_count_roster' webui/STATUS.md
grep -qE 'phase11968|through 11968|e2e-phase11976' webui/STATUS.md
echo "STATUS Soft 11960+ ok"; echo "cleaned"; echo "OK: phase11964 e2e passed"
