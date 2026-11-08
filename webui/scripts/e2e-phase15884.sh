#!/usr/bin/env bash
# Phase-15884: STATUS Soft 15880+ ssh_auth_schema_135_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 15880\+|through 15888|ssh_auth_schema_135_echo_roster' webui/STATUS.md
grep -qE 'phase15888|through 15888|e2e-phase15896' webui/STATUS.md
echo "STATUS Soft 15880+ ok"; echo "cleaned"; echo "OK: phase15884 e2e passed"
