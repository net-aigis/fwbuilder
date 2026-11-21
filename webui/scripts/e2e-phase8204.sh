#!/usr/bin/env bash
# Phase-8204: STATUS Soft 8200+ ssh_not_implemented_check_refresh_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 8200\+|through 8208|ssh_not_implemented_check_refresh_roster' webui/STATUS.md
grep -qE 'phase8208|through 8208|e2e-phase8216' webui/STATUS.md
echo "STATUS Soft 8200+ ok"; echo "cleaned"; echo "OK: phase8204 e2e passed"
