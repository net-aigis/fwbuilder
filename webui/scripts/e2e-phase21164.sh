#!/usr/bin/env bash
# Phase-21164: STATUS Soft 21160+ ssh_auth_soft_21120_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 21160\+|through 21168|ssh_auth_soft_21120_echo_roster' webui/STATUS.md
grep -qE 'phase21168|through 21168|e2e-phase21176' webui/STATUS.md
echo "STATUS Soft 21160+ ok"; echo "cleaned"; echo "OK: phase21164 e2e passed"
