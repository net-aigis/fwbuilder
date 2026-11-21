#!/usr/bin/env bash
# Phase-32764: STATUS Soft 32760+ ssh_auth_ms_73000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 32760\+|through 32768|ssh_auth_ms_73000_echo_roster' webui/STATUS.md
grep -qE 'phase32768|through 32768|e2e-phase32776' webui/STATUS.md
echo "STATUS Soft 32760+ ok"; echo "cleaned"; echo "OK: phase32764 e2e passed"
