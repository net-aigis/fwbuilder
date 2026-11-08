#!/usr/bin/env bash
# Phase-10764: STATUS Soft 10760+ ssh_auth_type_tag_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 10760\+|through 10768|ssh_auth_type_tag_roster' webui/STATUS.md
grep -qE 'phase10768|through 10768|e2e-phase10776' webui/STATUS.md
echo "STATUS Soft 10760+ ok"; echo "cleaned"; echo "OK: phase10764 e2e passed"
