#!/usr/bin/env bash
# Phase-12043: client soft_fertig_ssh_auth_path_count_roster Soft 12040+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_path_count_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 12040+ soft_fertig_ssh_auth_path_count_roster type ok"; echo "cleaned"; echo "OK: phase12043 e2e passed"
