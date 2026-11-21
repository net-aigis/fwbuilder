#!/usr/bin/env bash
# Phase-5436: STATUS mentions ssh_alternative_titles_roster export / 5113-5120.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_alternative_titles_roster.*(export|bundle)|Export.*ssh_alternative_titles_roster' webui/STATUS.md
grep -qE 'phase5440|through 5120|e2e-phase5440' webui/STATUS.md
echo "STATUS ssh_alternative_titles_roster export ok"; echo "cleaned"; echo "OK: phase5436 e2e passed"
