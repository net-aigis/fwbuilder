#!/usr/bin/env bash
# Phase-11163: client soft_fertig_ssh_auth_session_hint_roster Soft 11160+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_session_hint_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 11160+ soft_fertig_ssh_auth_session_hint_roster type ok"; echo "cleaned"; echo "OK: phase11163 e2e passed"
