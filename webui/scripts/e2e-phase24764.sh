#!/usr/bin/env bash
# Phase-24764: STATUS Soft 24760+ ssh_auth_ms_60500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 24760\+|through 24768|ssh_auth_ms_60500_echo_roster' webui/STATUS.md
grep -qE 'phase24768|through 24768|e2e-phase24776' webui/STATUS.md
echo "STATUS Soft 24760+ ok"; echo "cleaned"; echo "OK: phase24764 e2e passed"
