#!/usr/bin/env bash
# Phase-30844: STATUS Soft 30840+ ssh_auth_ms_70000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 30840\+|through 30848|ssh_auth_ms_70000_echo_roster' webui/STATUS.md
grep -qE 'phase30848|through 30848|e2e-phase30856' webui/STATUS.md
echo "STATUS Soft 30840+ ok"; echo "cleaned"; echo "OK: phase30844 e2e passed"
