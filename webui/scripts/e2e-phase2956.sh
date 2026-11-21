#!/usr/bin/env bash
# Phase-2956: STATUS mentions ssh_honesty_roster export / 2953-2960.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'ssh_honesty_roster.*(export|bundle)|export.*ssh_honesty_roster|bundle.*ssh_honesty_roster' webui/STATUS.md
grep -qE 'phase2960|through 2960|e2e-phase2960' webui/STATUS.md
echo "STATUS ssh_honesty_roster export ok"
echo "cleaned"
echo "OK: phase2956 e2e passed"
