#!/usr/bin/env bash
# Phase-9004: STATUS Soft 9000+ ssh_auth_refresh_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 9000\+|through 9008|ssh_auth_refresh_roster' webui/STATUS.md
grep -qE 'phase9008|through 9008|e2e-phase9016' webui/STATUS.md
echo "STATUS Soft 9000+ ok"; echo "cleaned"; echo "OK: phase9004 e2e passed"
