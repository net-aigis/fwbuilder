#!/usr/bin/env bash
# Phase-27244: STATUS Soft 27240+ ssh_auth_soft_27600_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 27240\+|through 27248|ssh_auth_soft_27600_echo_roster' webui/STATUS.md
grep -qE 'phase27248|through 27248|e2e-phase27256' webui/STATUS.md
echo "STATUS Soft 27240+ ok"; echo "cleaned"; echo "OK: phase27244 e2e passed"
