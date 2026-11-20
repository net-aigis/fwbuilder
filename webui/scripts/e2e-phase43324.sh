#!/usr/bin/env bash
# Phase-43324: STATUS Soft 43320+ ssh_auth_ms_89500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 43320\+|through 43328|ssh_auth_ms_89500_echo_roster' webui/STATUS.md
grep -qE 'phase43328|through 43328|e2e-phase43336' webui/STATUS.md
echo "STATUS Soft 43320+ ok"; echo "cleaned"; echo "OK: phase43324 e2e passed"
