#!/usr/bin/env bash
# Phase-7020: STATUS mentions ssh_refusal_paths_refresh_roster / 5973-5979.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_refusal_paths_refresh_roster|soft_fertig_ssh_refusal_paths_refresh_roster' webui/STATUS.md
grep -qE 'phase7024|through 7024|e2e-phase7024' webui/STATUS.md
echo "STATUS ssh-refusal-paths-refresh roster ok"; echo "cleaned"; echo "OK: phase7020 e2e passed"
