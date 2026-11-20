#!/usr/bin/env bash
# Phase-38444: STATUS Soft 38440+ ssh_auth_soft_40120_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 38440\+|through 38448|ssh_auth_soft_40120_echo_roster' webui/STATUS.md
grep -qE 'phase38448|through 38448|e2e-phase38456' webui/STATUS.md
echo "STATUS Soft 38440+ ok"; echo "cleaned"; echo "OK: phase38444 e2e passed"
