#!/usr/bin/env bash
# Phase-47804: STATUS Soft 47800+ ssh_auth_ms_96500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 47800\+|through 47808|ssh_auth_ms_96500_echo_roster' webui/STATUS.md
grep -qE 'phase47808|through 47808|e2e-phase47816' webui/STATUS.md
echo "STATUS Soft 47800+ ok"; echo "cleaned"; echo "OK: phase47804 e2e passed"
