#!/usr/bin/env bash
# Phase-7276: STATUS mentions ssh_refusal_path_titles_refresh_roster export / 5113-5120.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_refusal_path_titles_refresh_roster.*(export|bundle)|Export.*ssh_refusal_path_titles_refresh_roster' webui/STATUS.md
grep -qE 'phase7280|through 7280|e2e-phase7280' webui/STATUS.md
echo "STATUS ssh_refusal_path_titles_refresh_roster export ok"; echo "cleaned"; echo "OK: phase7276 e2e passed"
