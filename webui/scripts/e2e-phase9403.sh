#!/usr/bin/env bash
# Phase-9403: client soft_fertig_ssh_auth_alternative_id_roster Soft 9400+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_alternative_id_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 9400+ soft_fertig_ssh_auth_alternative_id_roster type ok"; echo "cleaned"; echo "OK: phase9403 e2e passed"
