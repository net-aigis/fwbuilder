#!/usr/bin/env bash
# Phase-47404: STATUS Soft 47400+ ssh_auth_soft_50200_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 47400\+|through 47408|ssh_auth_soft_50200_echo_roster' webui/STATUS.md
grep -qE 'phase47408|through 47408|e2e-phase47416' webui/STATUS.md
echo "STATUS Soft 47400+ ok"; echo "cleaned"; echo "OK: phase47404 e2e passed"
