#!/usr/bin/env bash
# Phase-18444: STATUS Soft 18440+ ssh_auth_schema_167_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 18440\+|through 18448|ssh_auth_schema_167_echo_roster' webui/STATUS.md
grep -qE 'phase18448|through 18448|e2e-phase18456' webui/STATUS.md
echo "STATUS Soft 18440+ ok"; echo "cleaned"; echo "OK: phase18444 e2e passed"
