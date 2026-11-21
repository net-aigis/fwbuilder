#!/usr/bin/env bash
# Phase-5500: STATUS mentions ssh_refusal_path_titles_roster / 5097-5104.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_refusal_path_titles_roster|soft_fertig_ssh_refusal_path_titles_roster' webui/STATUS.md
grep -qE 'phase5504|through 5104|e2e-phase5504' webui/STATUS.md
echo "STATUS ssh-refusal-path-titles roster ok"; echo "cleaned"; echo "OK: phase5500 e2e passed"
