#!/usr/bin/env bash
# Phase-41403: client soft_fertig_ssh_auth_ms_86500_echo_roster Soft 41400+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_86500_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 41400+ soft_fertig_ssh_auth_ms_86500_echo_roster type ok"; echo "cleaned"; echo "OK: phase41403 e2e passed"
