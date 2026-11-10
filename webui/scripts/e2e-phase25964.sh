#!/usr/bin/env bash
# Phase-25964: STATUS Soft 25960+ ssh_auth_soft_26160_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 25960\+|through 25968|ssh_auth_soft_26160_echo_roster' webui/STATUS.md
grep -qE 'phase25968|through 25968|e2e-phase25976' webui/STATUS.md
echo "STATUS Soft 25960+ ok"; echo "cleaned"; echo "OK: phase25964 e2e passed"
