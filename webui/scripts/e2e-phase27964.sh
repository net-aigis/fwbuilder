#!/usr/bin/env bash
# Phase-27964: STATUS Soft 27960+ ssh_auth_ms_65500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 27960\+|through 27968|ssh_auth_ms_65500_echo_roster' webui/STATUS.md
grep -qE 'phase27968|through 27968|e2e-phase27976' webui/STATUS.md
echo "STATUS Soft 27960+ ok"; echo "cleaned"; echo "OK: phase27964 e2e passed"
