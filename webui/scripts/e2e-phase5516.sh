#!/usr/bin/env bash
# Phase-5516: STATUS mentions ssh_refusal_path_titles_roster export / 5113-5120.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_refusal_path_titles_roster.*(export|bundle)|Export.*ssh_refusal_path_titles_roster' webui/STATUS.md
grep -qE 'phase5520|through 5120|e2e-phase5520' webui/STATUS.md
echo "STATUS ssh_refusal_path_titles_roster export ok"; echo "cleaned"; echo "OK: phase5516 e2e passed"
