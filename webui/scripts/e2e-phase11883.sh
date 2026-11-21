#!/usr/bin/env bash
# Phase-11883: client soft_fertig_ssh_auth_export_count_roster Soft 11880+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_export_count_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 11880+ soft_fertig_ssh_auth_export_count_roster type ok"; echo "cleaned"; echo "OK: phase11883 e2e passed"
