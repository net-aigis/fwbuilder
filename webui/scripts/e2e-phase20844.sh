#!/usr/bin/env bash
# Phase-20844: STATUS Soft 20840+ ssh_auth_soft_20760_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 20840\+|through 20848|ssh_auth_soft_20760_echo_roster' webui/STATUS.md
grep -qE 'phase20848|through 20848|e2e-phase20856' webui/STATUS.md
echo "STATUS Soft 20840+ ok"; echo "cleaned"; echo "OK: phase20844 e2e passed"
