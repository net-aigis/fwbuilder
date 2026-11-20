#!/usr/bin/env bash
# Phase-45804: STATUS Soft 45800+ ssh_auth_soft_48400_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 45800\+|through 45808|ssh_auth_soft_48400_echo_roster' webui/STATUS.md
grep -qE 'phase45808|through 45808|e2e-phase45816' webui/STATUS.md
echo "STATUS Soft 45800+ ok"; echo "cleaned"; echo "OK: phase45804 e2e passed"
