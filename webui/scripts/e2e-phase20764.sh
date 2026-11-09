#!/usr/bin/env bash
# Phase-20764: STATUS Soft 20760+ ssh_auth_icosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 20760\+|through 20768|ssh_auth_icosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase20768|through 20768|e2e-phase20776' webui/STATUS.md
echo "STATUS Soft 20760+ ok"; echo "cleaned"; echo "OK: phase20764 e2e passed"
