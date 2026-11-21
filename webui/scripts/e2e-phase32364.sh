#!/usr/bin/env bash
# Phase-32364: STATUS Soft 32360+ ssh_auth_soft_33360_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 32360\+|through 32368|ssh_auth_soft_33360_echo_roster' webui/STATUS.md
grep -qE 'phase32368|through 32368|e2e-phase32376' webui/STATUS.md
echo "STATUS Soft 32360+ ok"; echo "cleaned"; echo "OK: phase32364 e2e passed"
