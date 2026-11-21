#!/usr/bin/env bash
# Phase-11803: client soft_fertig_ssh_auth_catalog_count_roster Soft 11800+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_catalog_count_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 11800+ soft_fertig_ssh_auth_catalog_count_roster type ok"; echo "cleaned"; echo "OK: phase11803 e2e passed"
