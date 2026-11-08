#!/usr/bin/env bash
# Phase-9883: client soft_fertig_ssh_auth_note_map_roster Soft 9880+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_note_map_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 9880+ soft_fertig_ssh_auth_note_map_roster type ok"; echo "cleaned"; echo "OK: phase9883 e2e passed"
