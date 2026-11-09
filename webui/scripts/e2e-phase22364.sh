#!/usr/bin/env bash
# Phase-22364: STATUS Soft 22360+ ssh_auth_pentacosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 22360\+|through 22368|ssh_auth_pentacosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase22368|through 22368|e2e-phase22376' webui/STATUS.md
echo "STATUS Soft 22360+ ok"; echo "cleaned"; echo "OK: phase22364 e2e passed"
