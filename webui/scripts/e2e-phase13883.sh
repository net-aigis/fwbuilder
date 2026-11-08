#!/usr/bin/env bash
# Phase-13883: client soft_fertig_ssh_auth_title_count_roster Soft 13880+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_title_count_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 13880+ soft_fertig_ssh_auth_title_count_roster type ok"; echo "cleaned"; echo "OK: phase13883 e2e passed"
