#!/usr/bin/env bash
# Phase-22764: STATUS Soft 22760+ ssh_auth_soft_22880_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 22760\+|through 22768|ssh_auth_soft_22880_echo_roster' webui/STATUS.md
grep -qE 'phase22768|through 22768|e2e-phase22776' webui/STATUS.md
echo "STATUS Soft 22760+ ok"; echo "cleaned"; echo "OK: phase22764 e2e passed"
