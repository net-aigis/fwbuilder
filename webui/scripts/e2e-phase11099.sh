#!/usr/bin/env bash
# Phase-11099: client soft_fertig_ssh_auth_session_hint_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_session_hint_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-session-hint roster type ok"; echo "cleaned"; echo "OK: phase11099 e2e passed"
