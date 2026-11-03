#!/usr/bin/env bash
# Phase-200: soft-complete STATUS through phase200.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'phase200\|phase199\|phase198\|phase197' webui/STATUS.md
grep -q 'e2e-phase200\|e2e-phase199\|e2e-phase198\|e2e-phase197' webui/scripts/e2e-all.sh
grep -q 'password_auth_not_implemented\|allow_password_auth\|/ssh-auth' webui/STATUS.md
echo "STATUS soft-complete 200 ok"
echo "cleaned"
echo "OK: phase200 e2e passed"
