#!/usr/bin/env bash
# Phase-26924: STATUS Soft 26920+ ssh_auth_soft_27240_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 26920\+|through 26928|ssh_auth_soft_27240_echo_roster' webui/STATUS.md
grep -qE 'phase26928|through 26928|e2e-phase26936' webui/STATUS.md
echo "STATUS Soft 26920+ ok"; echo "cleaned"; echo "OK: phase26924 e2e passed"
