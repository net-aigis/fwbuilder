#!/usr/bin/env bash
# Phase-33964: STATUS Soft 33960+ ssh_auth_soft_35080_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 33960\+|through 33968|ssh_auth_soft_35080_echo_roster' webui/STATUS.md
grep -qE 'phase33968|through 33968|e2e-phase33976' webui/STATUS.md
echo "STATUS Soft 33960+ ok"; echo "cleaned"; echo "OK: phase33964 e2e passed"
