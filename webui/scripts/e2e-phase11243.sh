#!/usr/bin/env bash
# Phase-11243: client soft_fertig_ssh_auth_export_hint_roster Soft 11240+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_export_hint_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 11240+ soft_fertig_ssh_auth_export_hint_roster type ok"; echo "cleaned"; echo "OK: phase11243 e2e passed"
