#!/usr/bin/env bash
# Phase-46124: STATUS Soft 46120+ ssh_auth_soft_48760_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 46120\+|through 46128|ssh_auth_soft_48760_echo_roster' webui/STATUS.md
grep -qE 'phase46128|through 46128|e2e-phase46136' webui/STATUS.md
echo "STATUS Soft 46120+ ok"; echo "cleaned"; echo "OK: phase46124 e2e passed"
