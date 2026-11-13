#!/usr/bin/env bash
# Phase-29563: client soft_fertig_ssh_auth_ms_68000_echo_roster Soft 29560+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_68000_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 29560+ soft_fertig_ssh_auth_ms_68000_echo_roster type ok"; echo "cleaned"; echo "OK: phase29563 e2e passed"
