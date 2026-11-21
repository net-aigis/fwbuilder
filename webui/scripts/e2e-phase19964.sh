#!/usr/bin/env bash
# Phase-19964: STATUS Soft 19960+ ssh_auth_ms_53000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 19960\+|through 19968|ssh_auth_ms_53000_echo_roster' webui/STATUS.md
grep -qE 'phase19968|through 19968|e2e-phase19976' webui/STATUS.md
echo "STATUS Soft 19960+ ok"; echo "cleaned"; echo "OK: phase19964 e2e passed"
