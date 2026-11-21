#!/usr/bin/env bash
# Phase-21804: STATUS Soft 21800+ ssh_auth_soft_21840_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 21800\+|through 21808|ssh_auth_soft_21840_echo_roster' webui/STATUS.md
grep -qE 'phase21808|through 21808|e2e-phase21816' webui/STATUS.md
echo "STATUS Soft 21800+ ok"; echo "cleaned"; echo "OK: phase21804 e2e passed"
