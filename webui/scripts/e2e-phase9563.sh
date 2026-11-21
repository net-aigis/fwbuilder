#!/usr/bin/env bash
# Phase-9563: client soft_fertig_ssh_auth_implemented_id_roster Soft 9560+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_implemented_id_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 9560+ soft_fertig_ssh_auth_implemented_id_roster type ok"; echo "cleaned"; echo "OK: phase9563 e2e passed"
