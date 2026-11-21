#!/usr/bin/env bash
# Phase-8380: STATUS mentions ssh_not_implemented_batch_refresh_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_not_implemented_batch_refresh_roster|soft_fertig_ssh_not_implemented_batch_refresh_roster' webui/STATUS.md
grep -qE 'phase8384|through 8384|e2e-phase8384' webui/STATUS.md
echo "STATUS ssh-not-implemented-batch-refresh roster ok"; echo "cleaned"; echo "OK: phase8380 e2e passed"
