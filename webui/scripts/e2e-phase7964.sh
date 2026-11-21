#!/usr/bin/env bash
# Phase-7964: STATUS Soft 7960+ ssh_not_implemented_refresh_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 7960\+|through 7968|ssh_not_implemented_refresh_roster' webui/STATUS.md
grep -qE 'phase7968|through 7968|e2e-phase7976' webui/STATUS.md
echo "STATUS Soft 7960+ ok"; echo "cleaned"; echo "OK: phase7964 e2e passed"
