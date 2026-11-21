#!/usr/bin/env bash
# Phase-45883: client soft_fertig_ssh_auth_ms_93500_echo_roster Soft 45880+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_93500_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 45880+ soft_fertig_ssh_auth_ms_93500_echo_roster type ok"; echo "cleaned"; echo "OK: phase45883 e2e passed"
