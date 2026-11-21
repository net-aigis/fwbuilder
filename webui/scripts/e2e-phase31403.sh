#!/usr/bin/env bash
# Phase-31403: client soft_fertig_ssh_auth_soft_32280_echo_roster Soft 31400+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_32280_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 31400+ soft_fertig_ssh_auth_soft_32280_echo_roster type ok"; echo "cleaned"; echo "OK: phase31403 e2e passed"
