#!/usr/bin/env bash
# Phase-5036: STATUS mentions ssh_refusal_paths_roster export / 5033-5040.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_refusal_paths_roster.*(export|bundle)|Export.*ssh_refusal_paths_roster' webui/STATUS.md
grep -qE 'phase5040|through 5040|e2e-phase5040' webui/STATUS.md
echo "STATUS ssh_refusal_paths_roster export ok"; echo "cleaned"; echo "OK: phase5036 e2e passed"
