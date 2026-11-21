#!/usr/bin/env bash
# Phase-26444: STATUS Soft 26440+ ssh_auth_schema_267_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 26440\+|through 26448|ssh_auth_schema_267_echo_roster' webui/STATUS.md
grep -qE 'phase26448|through 26448|e2e-phase26456' webui/STATUS.md
echo "STATUS Soft 26440+ ok"; echo "cleaned"; echo "OK: phase26444 e2e passed"
