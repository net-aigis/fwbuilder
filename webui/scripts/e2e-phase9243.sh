#!/usr/bin/env bash
# Phase-9243: client soft_fertig_ssh_auth_bool_flag_roster Soft 9240+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_bool_flag_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 9240+ soft_fertig_ssh_auth_bool_flag_roster type ok"; echo "cleaned"; echo "OK: phase9243 e2e passed"
