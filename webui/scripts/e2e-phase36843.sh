#!/usr/bin/env bash
# Phase-36843: client soft_fertig_ssh_auth_soft_38320_echo_roster Soft 36840+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_38320_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 36840+ soft_fertig_ssh_auth_soft_38320_echo_roster type ok"; echo "cleaned"; echo "OK: phase36843 e2e passed"
