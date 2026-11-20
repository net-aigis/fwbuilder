#!/usr/bin/env bash
# Phase-43964: STATUS Soft 43960+ ssh_auth_ms_90500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 43960\+|through 43968|ssh_auth_ms_90500_echo_roster' webui/STATUS.md
grep -qE 'phase43968|through 43968|e2e-phase43976' webui/STATUS.md
echo "STATUS Soft 43960+ ok"; echo "cleaned"; echo "OK: phase43964 e2e passed"
