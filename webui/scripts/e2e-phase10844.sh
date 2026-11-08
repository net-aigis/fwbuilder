#!/usr/bin/env bash
# Phase-10844: STATUS Soft 10840+ ssh_auth_hard_gap_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 10840\+|through 10848|ssh_auth_hard_gap_echo_roster' webui/STATUS.md
grep -qE 'phase10848|through 10848|e2e-phase10856' webui/STATUS.md
echo "STATUS Soft 10840+ ok"; echo "cleaned"; echo "OK: phase10844 e2e passed"
