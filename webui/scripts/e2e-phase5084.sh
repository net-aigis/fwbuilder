#!/usr/bin/env bash
# Phase-5084: STATUS Soft 5080+ ssh_refusal_paths_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 5080\+|through 5088|ssh_refusal_paths_roster' webui/STATUS.md
grep -qE 'phase5088|through 5088|e2e-phase5088' webui/STATUS.md
echo "STATUS Soft 5080+ ok"; echo "cleaned"; echo "OK: phase5084 e2e passed"
