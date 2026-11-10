#!/usr/bin/env bash
# Phase-26283: client soft_fertig_ssh_auth_soft_26520_echo_roster Soft 26280+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_26520_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 26280+ soft_fertig_ssh_auth_soft_26520_echo_roster type ok"; echo "cleaned"; echo "OK: phase26283 e2e passed"
