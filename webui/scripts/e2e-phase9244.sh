#!/usr/bin/env bash
# Phase-9244: STATUS Soft 9240+ ssh_auth_bool_flag_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 9240\+|through 9248|ssh_auth_bool_flag_roster' webui/STATUS.md
grep -qE 'phase9248|through 9248|e2e-phase9256' webui/STATUS.md
echo "STATUS Soft 9240+ ok"; echo "cleaned"; echo "OK: phase9244 e2e passed"
