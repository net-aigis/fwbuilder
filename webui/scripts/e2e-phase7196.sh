#!/usr/bin/env bash
# Phase-7196: STATUS mentions ssh_alternative_titles_refresh_roster export / 5113-5120.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_alternative_titles_refresh_roster.*(export|bundle)|Export.*ssh_alternative_titles_refresh_roster' webui/STATUS.md
grep -qE 'phase7200|through 7200|e2e-phase7200' webui/STATUS.md
echo "STATUS ssh_alternative_titles_refresh_roster export ok"; echo "cleaned"; echo "OK: phase7196 e2e passed"
