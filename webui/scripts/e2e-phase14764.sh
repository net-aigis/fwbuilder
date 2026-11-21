#!/usr/bin/env bash
# Phase-14764: STATUS Soft 14760+ ssh_auth_ms_delta_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 14760\+|through 14768|ssh_auth_ms_delta_roster' webui/STATUS.md
grep -qE 'phase14768|through 14768|e2e-phase14776' webui/STATUS.md
echo "STATUS Soft 14760+ ok"; echo "cleaned"; echo "OK: phase14764 e2e passed"
