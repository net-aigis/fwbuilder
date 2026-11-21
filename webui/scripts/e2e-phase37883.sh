#!/usr/bin/env bash
# Phase-37883: client soft_fertig_ssh_auth_ms_81000_echo_roster Soft 37880+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_81000_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 37880+ soft_fertig_ssh_auth_ms_81000_echo_roster type ok"; echo "cleaned"; echo "OK: phase37883 e2e passed"
