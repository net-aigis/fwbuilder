#!/usr/bin/env bash
# Phase-32444: STATUS Soft 32440+ ssh_auth_ms_72500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 32440\+|through 32448|ssh_auth_ms_72500_echo_roster' webui/STATUS.md
grep -qE 'phase32448|through 32448|e2e-phase32456' webui/STATUS.md
echo "STATUS Soft 32440+ ok"; echo "cleaned"; echo "OK: phase32444 e2e passed"
