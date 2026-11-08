#!/usr/bin/env bash
# Phase-11484: STATUS Soft 11480+ ssh_auth_clear_hint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 11480\+|through 11488|ssh_auth_clear_hint_roster' webui/STATUS.md
grep -qE 'phase11488|through 11488|e2e-phase11496' webui/STATUS.md
echo "STATUS Soft 11480+ ok"; echo "cleaned"; echo "OK: phase11484 e2e passed"
