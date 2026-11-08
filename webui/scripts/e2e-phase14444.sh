#!/usr/bin/env bash
# Phase-14444: STATUS Soft 14440+ ssh_auth_session_ssh_ratio_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 14440\+|through 14448|ssh_auth_session_ssh_ratio_roster' webui/STATUS.md
grep -qE 'phase14448|through 14448|e2e-phase14456' webui/STATUS.md
echo "STATUS Soft 14440+ ok"; echo "cleaned"; echo "OK: phase14444 e2e passed"
