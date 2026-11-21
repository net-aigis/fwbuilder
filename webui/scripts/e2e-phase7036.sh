#!/usr/bin/env bash
# Phase-7036: STATUS mentions ssh_refusal_paths_refresh_roster export / 5113-5120.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_refusal_paths_refresh_roster.*(export|bundle)|Export.*ssh_refusal_paths_refresh_roster' webui/STATUS.md
grep -qE 'phase7040|through 7040|e2e-phase7040' webui/STATUS.md
echo "STATUS ssh_refusal_paths_refresh_roster export ok"; echo "cleaned"; echo "OK: phase7036 e2e passed"
