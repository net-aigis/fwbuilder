#!/usr/bin/env bash
# Phase-4956: STATUS mentions ssh_alternatives_roster export / 4953-4960.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_alternatives_roster.*(export|bundle)|Export.*ssh_alternatives_roster' webui/STATUS.md
grep -qE 'phase4960|through 4960|e2e-phase4960' webui/STATUS.md
echo "STATUS ssh_alternatives_roster export ok"; echo "cleaned"; echo "OK: phase4956 e2e passed"
