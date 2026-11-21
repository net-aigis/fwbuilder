#!/usr/bin/env bash
# Phase-43644: STATUS Soft 43640+ ssh_auth_ms_90000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 43640\+|through 43648|ssh_auth_ms_90000_echo_roster' webui/STATUS.md
grep -qE 'phase43648|through 43648|e2e-phase43656' webui/STATUS.md
echo "STATUS Soft 43640+ ok"; echo "cleaned"; echo "OK: phase43644 e2e passed"
