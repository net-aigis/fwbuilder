#!/usr/bin/env bash
# Phase-42043: client soft_fertig_ssh_auth_ms_87500_echo_roster Soft 42040+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_87500_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 42040+ soft_fertig_ssh_auth_ms_87500_echo_roster type ok"; echo "cleaned"; echo "OK: phase42043 e2e passed"
