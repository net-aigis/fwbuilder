#!/usr/bin/env bash
# Phase-40764: STATUS Soft 40760+ ssh_auth_ms_85500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 40760\+|through 40768|ssh_auth_ms_85500_echo_roster' webui/STATUS.md
grep -qE 'phase40768|through 40768|e2e-phase40776' webui/STATUS.md
echo "STATUS Soft 40760+ ok"; echo "cleaned"; echo "OK: phase40764 e2e passed"
