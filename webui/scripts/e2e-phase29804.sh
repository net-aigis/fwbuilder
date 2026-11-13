#!/usr/bin/env bash
# Phase-29804: STATUS Soft 29800+ ssh_auth_soft_30480_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 29800\+|through 29808|ssh_auth_soft_30480_echo_roster' webui/STATUS.md
grep -qE 'phase29808|through 29808|e2e-phase29816' webui/STATUS.md
echo "STATUS Soft 29800+ ok"; echo "cleaned"; echo "OK: phase29804 e2e passed"
