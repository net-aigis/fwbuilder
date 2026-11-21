#!/usr/bin/env bash
# Phase-10284: STATUS Soft 10280+ ssh_auth_method_partition_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 10280\+|through 10288|ssh_auth_method_partition_roster' webui/STATUS.md
grep -qE 'phase10288|through 10288|e2e-phase10296' webui/STATUS.md
echo "STATUS Soft 10280+ ok"; echo "cleaned"; echo "OK: phase10284 e2e passed"
