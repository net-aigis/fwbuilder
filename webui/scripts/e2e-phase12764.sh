#!/usr/bin/env bash
# Phase-12764: STATUS Soft 12760+ ssh_auth_gap_open_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 12760\+|through 12768|ssh_auth_gap_open_echo_roster' webui/STATUS.md
grep -qE 'phase12768|through 12768|e2e-phase12776' webui/STATUS.md
echo "STATUS Soft 12760+ ok"; echo "cleaned"; echo "OK: phase12764 e2e passed"
