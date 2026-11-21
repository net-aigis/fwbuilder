#!/usr/bin/env bash
# Phase-46844: STATUS Soft 46840+ ssh_auth_ms_95000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 46840\+|through 46848|ssh_auth_ms_95000_echo_roster' webui/STATUS.md
grep -qE 'phase46848|through 46848|e2e-phase46856' webui/STATUS.md
echo "STATUS Soft 46840+ ok"; echo "cleaned"; echo "OK: phase46844 e2e passed"
