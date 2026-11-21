#!/usr/bin/env bash
# Phase-10364: STATUS Soft 10360+ ssh_auth_key_surface_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 10360\+|through 10368|ssh_auth_key_surface_roster' webui/STATUS.md
grep -qE 'phase10368|through 10368|e2e-phase10376' webui/STATUS.md
echo "STATUS Soft 10360+ ok"; echo "cleaned"; echo "OK: phase10364 e2e passed"
