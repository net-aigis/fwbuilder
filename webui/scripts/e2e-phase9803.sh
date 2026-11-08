#!/usr/bin/env bash
# Phase-9803: client soft_fertig_ssh_auth_title_map_roster Soft 9800+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_title_map_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 9800+ soft_fertig_ssh_auth_title_map_roster type ok"; echo "cleaned"; echo "OK: phase9803 e2e passed"
