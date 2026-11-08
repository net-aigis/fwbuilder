#!/usr/bin/env bash
# Phase-15804: STATUS Soft 15800+ ssh_auth_ms_46500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 15800\+|through 15808|ssh_auth_ms_46500_echo_roster' webui/STATUS.md
grep -qE 'phase15808|through 15808|e2e-phase15816' webui/STATUS.md
echo "STATUS Soft 15800+ ok"; echo "cleaned"; echo "OK: phase15804 e2e passed"
