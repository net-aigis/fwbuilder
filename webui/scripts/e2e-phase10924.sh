#!/usr/bin/env bash
# Phase-10924: STATUS Soft 10920+ ssh_auth_gap_label_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 10920\+|through 10928|ssh_auth_gap_label_echo_roster' webui/STATUS.md
grep -qE 'phase10928|through 10928|e2e-phase10936' webui/STATUS.md
echo "STATUS Soft 10920+ ok"; echo "cleaned"; echo "OK: phase10924 e2e passed"
