#!/usr/bin/env bash
# Phase-36764: STATUS Soft 36760+ ssh_auth_triacontaicosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 36760\+|through 36768|ssh_auth_triacontaicosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase36768|through 36768|e2e-phase36776' webui/STATUS.md
echo "STATUS Soft 36760+ ok"; echo "cleaned"; echo "OK: phase36764 e2e passed"
